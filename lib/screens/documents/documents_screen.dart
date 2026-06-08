import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/document_ref.dart';
import 'package:my_vehicles/providers/document_provider.dart';
import 'package:my_vehicles/services/document_service.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/utils/id_generator.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/empty_state.dart';
import 'package:my_vehicles/widgets/staggered_list_item.dart';
import 'package:path/path.dart' as p;

class DocumentsScreen extends ConsumerWidget {
  const DocumentsScreen({super.key, this.parentType, this.parentId});

  final String? parentType;
  final String? parentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final docsAsync = ref.watch(documentsProvider);

    return AppScaffold(
      title: 'Documents',
      useOverlayNav: true,
      showBackButton: true,
      overlayFabIcon: Icons.add_rounded,
      overlayFabOnPressed: () => _pickDocument(context, ref),
      body: docsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (allDocs) {
          final docs = (parentType != null && parentId != null)
              ? allDocs
                  .where((d) =>
                      d.parentType == parentType &&
                      d.parentId == parentId)
                  .toList()
              : allDocs;

          if (docs.isEmpty) {
            return EmptyState(
              message: 'No documents',
              subtitle: 'Add photos, PDFs, or other files',
              actionLabel: 'Add Document',
              onAction: () => _pickDocument(context, ref),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              return StaggeredListItem(
                index: index,
                child: _DocumentTile(
                  doc: doc,
                  onTap: () => DocumentService.openFile(doc.localPath),
                  onDelete: () => _confirmDelete(context, ref, doc),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _pickDocument(BuildContext context, WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;
    if (file.path == null) return;

    final String savedPath;
    try {
      savedPath = await DocumentService.saveFile(file.path!, file.name);
    } catch (e) {
      debugPrint('Failed to save document: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Couldn't save the document. Please try again.")),
        );
      }
      return;
    }

    final doc = DocumentRef(
      id: generateId(),
      parentType: parentType ?? 'vehicle',
      parentId: parentId ?? '',
      filename: file.name,
      localPath: savedPath,
      fileType: DocumentService.getFileType(file.path!),
      addedDate: todayAsString(),
    );

    await ref.read(documentsProvider.notifier).addDocument(doc);
  }

  void _confirmDelete(
      BuildContext context, WidgetRef ref, DocumentRef doc) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Document?'),
        content: Text('Delete ${doc.filename}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await DocumentService.deleteFile(doc.localPath);
              await ref
                  .read(documentsProvider.notifier)
                  .deleteDocument(doc.id);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Delete',
                style: TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}

class _DocumentTile extends StatelessWidget {
  const _DocumentTile({
    required this.doc,
    required this.onTap,
    required this.onDelete,
  });

  final DocumentRef doc;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final isImage = doc.fileType == 'Image';
    final ext = p.extension(doc.filename).toUpperCase().replaceFirst('.', '');

    return Card(
      child: InkWell(
        onTap: onTap,
        onLongPress: onDelete,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.softPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isImage
                      ? Icons.image_rounded
                      : Icons.insert_drive_file_rounded,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                doc.filename,
                style: AppTextStyles.bodyBold.copyWith(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                ext,
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
