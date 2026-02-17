import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// On-device OCR using Google ML Kit text recognition.
/// Works on Android and iOS. Fails gracefully on unsupported platforms.
class OcrService {
  static final _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  /// Extract text from an image file at [filePath].
  /// Returns the full recognized text, or null if OCR fails or is unsupported.
  static Future<String?> extractTextFromImage(String filePath) async {
    try {
      final inputImage = InputImage.fromFilePath(filePath);
      final result = await _textRecognizer.processImage(inputImage);

      if (result.text.isEmpty) return null;
      return result.text;
    } catch (_) {
      // ML Kit not available on this platform (e.g. Linux desktop)
      return null;
    }
  }

  /// Clean up resources when no longer needed.
  static Future<void> dispose() async {
    await _textRecognizer.close();
  }
}
