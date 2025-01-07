import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactContent extends StatefulWidget {
  const ContactContent({super.key});

  @override
  State<ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  Widget _buildContactForm(BuildContext context, bool isMobile) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (isMobile) ...[
            // Mobile: Stack inputs vertically
            _buildTextField(_nameController, 'Your name'),
            const SizedBox(height: 16),
            _buildTextField(_emailController, 'Email address'),
            const SizedBox(height: 16),
            _buildTextField(_phoneController, 'Phone'),
            const SizedBox(height: 16),
            _buildTextField(_subjectController, 'Subject'),
          ] else ...[
            // Desktop: Two inputs per row
            Row(
              children: [
                Expanded(child: _buildTextField(_nameController, 'Your name')),
                const SizedBox(width: 16),
                Expanded(
                    child: _buildTextField(_emailController, 'Email address')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildTextField(_phoneController, 'Phone')),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField(_subjectController, 'Subject')),
              ],
            ),
          ],
          const SizedBox(height: 16),
          _buildTextField(_messageController, 'Write a message', maxLines: 6),
          const SizedBox(height: 24),
          // Submit Button remains the same
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Handle form submission
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFD700),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              'SEND A MESSAGE',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText, {
    int? maxLines,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isMobile) {
    final contactItems = [
      const _ContactItem(
        icon: Icons.phone,
        title: 'Helpline',
        detail: '+250 788 652 294',
      ),
      const _ContactItem(
        icon: Icons.email,
        title: 'Email',
        detail: 'info@ubumwecommunitycenter.rw',
      ),
      const _ContactItem(
        icon: Icons.location_on,
        title: 'Address',
        detail: 'P.O BOX 312 Gisenyi, Rubavu, Rwanda',
      ),
    ];

    return SizedBox(
      width: double.infinity,
      child: isMobile
          ? Column(
              children: contactItems.map((item) {
                final index = contactItems.indexOf(item);
                return Column(
                  children: [
                    item.build(),
                    if (index < contactItems.length - 1)
                      const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            )
          : Row(
              children: contactItems.asMap().entries.map((entry) {
                final index = entry.key;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: index == 1 ? 16.0 : 0,
                    ),
                    child: entry.value.build(),
                  ),
                );
              }).toList(),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final contentWidth = isMobile ? double.infinity : screenWidth * 0.7;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Header
            Text(
              'Ubumwe Community Center',
              style: GoogleFonts.caveat(
                fontSize: 20,
                color: const Color(0xFFFFD700), // Golden yellow
                // fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Feel free to contact us',
              style: GoogleFonts.nunito(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Responsive form
            SizedBox(
              width: contentWidth,
              child: _buildContactForm(context, isMobile),
            ),
            const SizedBox(height: 48),

            // Responsive contact info
            SizedBox(
              width: contentWidth,
              child: _buildContactInfo(context, isMobile),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}

class _ContactItem {
  final IconData icon;
  final String title;
  final String detail;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.detail,
  });

  Widget build() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFFFFD700),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SelectableText(
            detail,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
