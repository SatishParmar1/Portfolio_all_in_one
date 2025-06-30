import 'package:flutter/material.dart';
import 'package:portfolio/textdata/alllink.dart';
import 'package:portfolio/textdata/alltext.dart';

class Gridviewphotos extends StatefulWidget {
  Gridviewphotos({super.key});

  @override
  State<Gridviewphotos> createState() => _GridviewphotosState();
}

class _GridviewphotosState extends State<Gridviewphotos> {
  final List<Map<String, String>> images = [
    {
      'image': Alllink.myimage1,
      'description': Alltext.aboutmedata,
    },
    {
      'image': Alllink.myimage2,
      'description': Alltext.aboutmedata,
    },
    {
      'image': Alllink.myimage3,
      'description': Alltext.aboutmedata,
    },
    {
      'image': Alllink.myimage4,
      'description': Alltext.aboutmedata,
    },
  ];

  int _visibleCount = 3;

  void _showFullImage(BuildContext context, String image, String description, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.95,
          minChildSize: 0.7,
          maxChildSize: 1.0,
          builder: (context, scrollController) {
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          hoverColor: Colors.grey,
                          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
                        )
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                image,
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () => _showDescriptionOverlay(context, description,index+1),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Text(
                                    description,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showFullDescription(BuildContext context, String description, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black87,
        content: SingleChildScrollView(
          child: Text(
            description,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showDescriptionOverlay(BuildContext context, String description, int index) {
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
                Text('${index} Image',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  description,
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


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 1 : 3;
    final showShowMore = images.length > _visibleCount;

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _visibleCount > images.length ? images.length : _visibleCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final data = images[index];
            return GestureDetector(
              onTap: () => _showFullImage(
                context,
                data['image']!,
                data['description']!,
                index
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      data['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () => _showDescriptionOverlay(context, data['description']!, index+1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          data['description']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        if (showShowMore)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _visibleCount = (_visibleCount + 3).clamp(0, images.length);
                });
              },
              child: const Text('Show More', style: TextStyle(color: Colors.black)),
            ),
          ),
      ],
    );
  }
}
