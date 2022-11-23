abstract class LinkHandler {
  const LinkHandler();

  /// Handles the given link.
  /// Returns true if the link should not be handled by next handlers.
  bool handle(Uri link);
}
