import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const TopBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF2A3C35),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.yellow,
            height: 5,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                color: const Color(0xFF283734),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Image.asset('assets/logo.png', height: 50),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      color: const Color(0xFF212D2B),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildContactInfo(
                              icon: Icons.favorite,
                              text: 'Become a volunteers',
                              color: const Color(0xFFFFD84D),
                              showIcon: false,
                            ),
                            
                            const SizedBox(width: 16),
                            _buildContactInfo(
                              icon: Icons.phone,
                              text: '+250 788 652 294',
                              subtitle: 'Helpline - RWA',
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            const VerticalDivider(
                              color: Colors.white24,
                              width: 1,
                              indent: 8,
                              endIndent: 8,
                            ),
                            const SizedBox(width: 8),
                            _buildContactInfo(
                              icon: Icons.phone,
                              text: '+1 (614) 420-0824',
                              subtitle: 'Helpline - USA',
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            const VerticalDivider(
                              color: Colors.white24,
                              width: 1,
                              indent: 8,
                              endIndent: 8,
                            ),
                            const SizedBox(width: 8),
                            _buildContactInfo(
                              icon: Icons.email,
                              text: 'info@ubumwecommunitycenter.rw',
                              subtitle: 'Send email',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xFF31423F),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _buildNavItem('Home', 0),
                              _buildNavItem('About Us', 1),
                              _buildNavItem('Mission & Vision', 2),
                              _buildNavItem('What we do', 3),
                              _buildNavItem('Partners', 4),
                              _buildNavItem('Contact', 5),
                              _buildNavItem('Tenders', 6),
                            ],
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFD84D),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            icon: const Icon(Icons.favorite, size: 18),
                            label: const Text(
                              'Donate now',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () => onTap(index),
        child: Text(
          label,
          style: TextStyle(
            color: currentIndex == index ? Colors.white : Colors.white70,
            fontSize: 15,
            fontWeight:
                currentIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo({
    required IconData icon,
    required String text,
    String? subtitle,
    required Color color,
    bool showIcon = true,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(icon, color: const Color(0xFF00A884), size: 20),
            const SizedBox(width: 8),
          ],
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (subtitle != null)
                Text(
                  subtitle,
                  style: TextStyle(
                    color: color.withOpacity(0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class MobileDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MobileDrawer({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Drawer(
      child: Container(
        color: theme.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerNavItem('Home', 0),
            _buildDrawerNavItem('About Us', 1),
            _buildDrawerNavItem('Mission & Vision', 2),
            _buildDrawerNavItem('What we do', 3),
            _buildDrawerNavItem('Partners', 4),
            _buildDrawerNavItem('Contact', 5),
            _buildDrawerNavItem('Tenders', 6),
            const Divider(color: Colors.white30),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.secondary,
                  foregroundColor: theme.onSecondary,
                ),
                icon: const Icon(Icons.favorite, size: 18),
                label: const Text('Donate now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerNavItem(String label, int index) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(color: Colors.white70),
      ),
      selected: currentIndex == index,
      selectedColor: Colors.white,
      onTap: () => onTap(index),
    );
  }

  Widget _buildDrawerContactInfo({
    required IconData icon,
    required String text,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70, size: 20),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            )
          : null,
    );
  }
}
