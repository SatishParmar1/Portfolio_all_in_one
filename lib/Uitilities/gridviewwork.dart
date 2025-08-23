import 'package:flutter/material.dart';
import 'package:portfolio/Uitilities/url_lancher.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'dart:async';

class Workcard extends StatefulWidget {
  final String image;
  final String title;
  final Uri link;
  final String description;
  final int maxline;

  const Workcard({
    super.key,
    required this.image,
    required this.title,
    required this.link,
    required this.description,
    required this.maxline,
  });

  @override
  State<Workcard> createState() => _WorkcardState();
}

class _WorkcardState extends State<Workcard> with SingleTickerProviderStateMixin {
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
                  textAlign: TextAlign.justify,
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

    // Calculate image height based on flex: 7 of total flex: 9 (7+2)
    final imageHeight = cardSize.height * 7 / 9;

    _animationController?.forward(from: 0);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: cardOffset.dx,
        top: cardOffset.dy,
        width: cardSize.width,
        height: imageHeight,
        child: MouseRegion(
          onEnter: (_) {
            _isHoveringOverlay = true;
            _hideTimer?.cancel();
          },
          onExit: (_) {
            _isHoveringOverlay = false;
            _startHideTooltipDelay();
          },
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
                      widget.description,
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
    Widget cardContent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 7,
          child: InkWell(
            onTap: () {
              if (widget.link.toString() != "") {
                Urllancher().launchInBrowser(widget.link);
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: (){
            _showDescriptionOverlay(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
       /* SizedBox(height: 5),
        Expanded(
          flex: 2,
          child: Text(
            widget.description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white54,
            ),
            textAlign: TextAlign.justify,
            maxLines: widget.maxline,
            overflow: TextOverflow.ellipsis,
          ),
        ),*/
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child:/* kIsWeb
          ? InkWell(
        onTap: (){
          if (widget.link.toString() != "") {
            Urllancher().launchInBrowser(widget.link);
          }
        },
            child: MouseRegion(
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
              ),
          )
          :*/ cardContent,
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

