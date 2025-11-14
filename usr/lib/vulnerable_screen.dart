import 'package:flutter/material.dart';

class VulnerableScreen extends StatefulWidget {
  const VulnerableScreen({super.key});

  @override
  State<VulnerableScreen> createState() => _VulnerableScreenState();
}

class _VulnerableScreenState extends State<VulnerableScreen> {
  final TextEditingController _sqlInjectionController = TextEditingController();
  final TextEditingController _xssController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intentionally Vulnerable App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select 3 vulnerabilities to demonstrate (at least 1 from each group).',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildVulnerabilityGroup(
              title: 'Group A: Data & Backend',
              vulnerabilities: [
                _buildVulnerabilityWidget(
                  title: 'SQL Injection',
                  description: 'Enter a user ID to search. Try to use SQL injection to see all users.',
                  child: TextField(
                    controller: _sqlInjectionController,
                    decoration: const InputDecoration(
                      labelText: "Enter User ID (e.g., 1)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                _buildVulnerabilityWidget(
                  title: 'Insecure File Upload',
                  description: 'Upload any type of file. The system does not validate file types.',
                  child: ElevatedButton(
                    onPressed: () {
                      // Placeholder for file upload logic
                    },
                    child: const Text('Upload File'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildVulnerabilityGroup(
              title: 'Group B: Session & Access Control',
              vulnerabilities: [
                _buildVulnerabilityWidget(
                  title: 'Cross-Site Scripting (XSS)',
                  description: 'Enter a comment. The comment will be displayed without sanitization.',
                  child: TextField(
                    controller: _xssController,
                    decoration: const InputDecoration(
                      labelText: "Enter a comment",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                _buildVulnerabilityWidget(
                  title: 'Broken Access Control',
                  description: "Try to access another user's profile by manipulating the URL or API request.",
                  child: ElevatedButton(
                    onPressed: () {
                      // Placeholder for access control demo
                    },
                    child: const Text("View User 2's Profile"),
                  ),
                ),
                _buildVulnerabilityWidget(
                  title: 'Cross-Site Request Forgery (CSRF)',
                  description: 'This action can be triggered from an external site without your knowledge.',
                  child: ElevatedButton(
                    onPressed: () {
                      // Placeholder for CSRF demo
                    },
                    child: const Text('Change Email'),
                  ),
                ),
              ],
            ),
             const SizedBox(height: 20),
            _buildVulnerabilityGroup(
              title: 'Group C: Configuration & Authentication',
              vulnerabilities: [
                _buildVulnerabilityWidget(
                  title: 'Insecure Authentication',
                  description: 'Login with a weak password or view unencrypted credentials.',
                  child: ElevatedButton(
                    onPressed: () {
                      // Placeholder for insecure auth demo
                    },
                    child: const Text('Login'),
                  ),
                ),
                _buildVulnerabilityWidget(
                  title: 'Security Misconfiguration',
                  description: 'Default credentials are used. Try logging in with admin/admin.',
                  child: ElevatedButton(
                    onPressed: () {
                      // Placeholder for misconfiguration demo
                    },
                    child: const Text('Admin Login'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVulnerabilityGroup({required String title, required List<Widget> vulnerabilities}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ...vulnerabilities,
          ],
        ),
      ),
    );
  }

  Widget _buildVulnerabilityWidget({required String title, required String description, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
