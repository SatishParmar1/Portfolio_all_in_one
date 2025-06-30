import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:portfolio/textdata/alllink.dart';

class SkillCard extends StatefulWidget {
  final String image;
  final String title;
  final Color color;
  final String description;

  const SkillCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    required this.description,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  bool _isHoveringCard = false;
  bool _isHoveringOverlay = false;
  Timer? _hideTimer;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 180),
      reverseDuration: Duration(milliseconds: 120),
    );
  }

  void _showDescriptionOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTooltip(BuildContext context, RenderBox cardBox) {
    final overlay = Overlay.of(context);
    final cardOffset = cardBox.localToGlobal(Offset.zero);
    final cardSize = cardBox.size;

    _animationController?.forward(from: 0);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: cardOffset.dx,
        top: cardOffset.dy,
        width: cardSize.width,
        height: cardSize.height,
        child: MouseRegion(
          onEnter: (_) {
            _isHoveringOverlay = true;
            _hideTimer?.cancel();
          },
          onExit: (_) {
            _isHoveringOverlay = false;
            _startHideTooltipDelay();
          },
          hitTestBehavior: HitTestBehavior.translucent,
          child: IgnorePointer(
            ignoring: true, // Let all pointer events (including scroll) pass through
            child: Material(
              color: Colors.transparent,
              child: FadeTransition(
                opacity: _animationController!,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.97, end: 1.0).animate(
                    CurvedAnimation(parent: _animationController!, curve: Curves.easeOut)),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        widget.title,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _hideTooltip() {
    if (_overlayEntry != null && _animationController != null) {
      _animationController!.reverse().then((_) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      });
    }
  }

  void _startHideTooltipDelay() {
    _hideTimer?.cancel();
    _hideTimer = Timer(Duration(milliseconds: 100), () {
      if (!_isHoveringCard && !_isHoveringOverlay) {
        _hideTooltip();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget cardContent = InkWell(
      onTap: () => _showDescriptionOverlay(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            widget.image,
            height: 48,
            width: 48,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 48);
            },
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: /*kIsWeb
          ? MouseRegion(
              onEnter: (event) {
                _isHoveringCard = true;
                final cardBox = context.findRenderObject() as RenderBox;
                if (_overlayEntry == null) {
                  _showTooltip(context, cardBox);
                }
                _hideTimer?.cancel();
              },
              onExit: (event) {
                _isHoveringCard = false;
                _startHideTooltipDelay();
              },
              child: cardContent,
            )
          : */cardContent,
    );
  }

  @override
  void dispose() {
    _hideTooltip();
    _hideTimer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }
}
