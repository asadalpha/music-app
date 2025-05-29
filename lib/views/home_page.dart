import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/models/service_model.dart';
import 'package:music_app/viewmodels/service_viewmodel.dart';
import 'package:music_app/views/new_page.dart';
import 'package:music_app/views/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

class MusicProductionHomePage extends StatefulWidget {
  const MusicProductionHomePage({super.key});

  @override
  State<MusicProductionHomePage> createState() =>
      _MusicProductionHomePageState();
}

class _MusicProductionHomePageState extends State<MusicProductionHomePage> {
  List<String> listIcons = ["1.svg", "2.svg", "3.svg", "4.svg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18171C),
      body: SafeArea(
        child: ListView(
          children: [
            _buildHeader(context),

            _buildMainContent(context),

            _buildServicesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFD91A60), Color(0xFFB91655)],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: CustomSearchBar()),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 22.5,
                backgroundColor: Colors.white.withOpacity(0.2),
                child: SvgPicture.asset(
                  'assets/avatar.svg',
                  color: Color(0xffEADDFF),
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          Text(
            'Claim your',
            style: GoogleFonts.syne(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            'Free Demo',
            style: GoogleFonts.lobsterTwo(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'for Custom Music Production',
            style: GoogleFonts.syne(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                // Handle book now action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                elevation: 0,
              ),
              child: Text(
                'Book Now',
                style: GoogleFonts.syne(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 26, 26, 31),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.center,
            'Hire hand-picked Pros for popular music services!',
            style: GoogleFonts.syne(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildServicesList(BuildContext context) {
    final data = Provider.of<ServiceViewModel>(context);

    if (data.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      color: const Color.fromARGB(255, 26, 26, 31),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.services.length,
        itemBuilder: (context, index) {
          final service = data.services[index];

          return _buildServiceCard(context, service);
        },
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, Service service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 26, 26, 31),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewPage()),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child:
                        service.icon == null
                            ? SvgPicture.asset(
                              "assets/1.svg",

                              // color: Colors.white,
                              fit: BoxFit.contain,
                            )
                            : SvgPicture.asset(
                              "assets/${service.icon}",

                              // color: Colors.white,
                              fit: BoxFit.contain,
                            ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service.description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white.withOpacity(0.5),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
