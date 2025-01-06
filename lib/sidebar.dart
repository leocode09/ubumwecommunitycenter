import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  final String currentPath;

  const Sidebar({
    super.key,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Container(
          color: const Color(0xFF283734),
          child: SafeArea(
            child: Column(
              children: [
                // Header Section
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF212D2B),
                    border: Border(
                      bottom: BorderSide(color: Colors.white10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/logo.png', height: 40, width: double.infinity),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        alignment: Alignment.center,
                        child: const Text(
                          'Disability is not Inability',
                          style: TextStyle(
                            color: Color(0xFFFFD700),
                            fontSize: 16,
                            fontFamily: 'Caveat',
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Navigation Section
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    children: [
                      _buildDrawerNavItem(context, 'Home', '/'),
                      _buildDrawerNavItem(context, 'About Us', '/about'),
                      _buildDrawerNavItem(context, 'Mission & Vision', '/vision'),
                      _buildDrawerNavItem(context, 'What we do', '/does'),
                      _buildDrawerNavItem(context, 'Partners', '/partners'),
                      _buildDrawerNavItem(context, 'Contact', '/contact'),
                      _buildDrawerNavItem(context, 'Tenders', '/tenders'),
                      
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Divider(color: Colors.white10, height: 1),
                      ),

                      // Contact Section
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      _buildDrawerContactInfo(
                        icon: Icons.phone,
                        text: '+250 788 652 294',
                        subtitle: 'Helpline - RWA',
                      ),
                      _buildDrawerContactInfo(
                        icon: Icons.phone,
                        text: '+1 (614) 420-0824',
                        subtitle: 'Helpline - USA',
                      ),
                      _buildDrawerContactInfo(
                        icon: Icons.email,
                        text: 'info@ubumwecommunitycenter.rw',
                        subtitle: 'Send email',
                      ),
                    ],
                  ),
                ),

                // Donate Button
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.white10)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/donate');
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD700),
                      foregroundColor: const Color(0xFF263331),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Donate now',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerNavItem(BuildContext context, String label, String path) {
    final isSelected = currentPath == path;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFFFD700) : Colors.white.withOpacity(0.9),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 15,
            letterSpacing: 0.3,
          ),
        ),
        onTap: () {
          context.go(path);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildDrawerContactInfo({
    required IconData icon,
    required String text,
    String? subtitle,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF00A884).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF00A884), size: 20),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            )
          : null,
    );
  }
}
