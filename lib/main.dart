import 'package:flutter/material.dart';

void main() {
  runApp(const ForestBikesApp());
}

class ForestBikesApp extends StatelessWidget {
  const ForestBikesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forest Bikes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF6F8F5),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF1B3B22), // Deep Pine Green
          onPrimary: Colors.white,
          secondary: Color(0xFFC77846), // Timber Amber
          onSecondary: Colors.white,
          tertiary: Color(0xFF5A7D63), // Moss Green
          onTertiary: Colors.white,
          surface: Colors.white,
          onSurface: Color(0xFF1E261F),
          error: Color(0xFFBA1A1A),
          onError: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFFF6F8F5),
          foregroundColor: Color(0xFF1B3B22),
          centerTitle: false,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// ---------------------------------------------------------------------------
// DATA MODELS
// ---------------------------------------------------------------------------

enum BikeCategory { all, trail, enduro, downhill, eBikes }

class Bike {
  final String id;
  final String name;
  final String series;
  final BikeCategory category;
  final double dailyRate;
  final double rating;
  final String travel;
  final String weight;
  final String frame;
  final String description;
  final IconData displayIcon;

  const Bike({
    required this.id,
    required this.name,
    required this.series,
    required this.category,
    required this.dailyRate,
    required this.rating,
    required this.travel,
    required this.weight,
    required this.frame,
    required this.description,
    required this.displayIcon,
  });
}

class ForestTrail {
  final String name;
  final String difficulty;
  final String distance;
  final String elevation;
  final String condition;
  final Color difficultyColor;

  const ForestTrail({
    required this.name,
    required this.difficulty,
    required this.distance,
    required this.elevation,
    required this.condition,
    required this.difficultyColor,
  });
}

final List<Bike> sampleBikes = [
  const Bike(
    id: 'b1',
    name: 'Redwood Peak Carbon',
    series: 'Alpine Enduro Series',
    category: BikeCategory.enduro,
    dailyRate: 85.00,
    rating: 4.9,
    travel: '170mm / 165mm',
    weight: '14.2 kg',
    frame: 'Toray T800 Carbon',
    description:
        'Engineered for steep, loam-covered pine forest descents. Features FOX Factory suspension and high-pivot chain routing for technical roots.',
    displayIcon: Icons.directions_bike_rounded,
  ),
  const Bike(
    id: 'b2',
    name: 'Mosswood Scout LT',
    series: 'Forest Flow Trail',
    category: BikeCategory.trail,
    dailyRate: 65.00,
    rating: 4.8,
    travel: '140mm / 130mm',
    weight: '13.1 kg',
    frame: 'Triple-Butted Alloy',
    description:
        'The ultimate nimble companion for winding singletrack, rolling forest switchbacks, and natural cedar jumps.',
    displayIcon: Icons.pedal_bike_rounded,
  ),
  const Bike(
    id: 'b3',
    name: 'PineRidge Electro-Climb',
    series: 'E-Mountain Powerline',
    category: BikeCategory.eBikes,
    dailyRate: 110.00,
    rating: 4.95,
    travel: '160mm / 150mm',
    weight: '21.5 kg',
    frame: 'Hydroformed Alloy',
    description:
        '85Nm Bosch Performance CX motor with a 750Wh forest endurance battery. Conquer fire road ascents effortlessly to hit twice the descents.',
    displayIcon: Icons.electric_bike_rounded,
  ),
  const Bike(
    id: 'b4',
    name: 'Blackwood DH Slayer',
    series: 'Pure Downhill',
    category: BikeCategory.downhill,
    dailyRate: 95.00,
    rating: 4.7,
    travel: '200mm / 200mm',
    weight: '16.8 kg',
    frame: 'Raw Carbon & RockShox',
    description:
        'Built for bike park drops, granite slab gaps, and high-speed roots. Dual-crown fork for maximum rigidity.',
    displayIcon: Icons.two_wheeler_rounded,
  ),
];

final List<ForestTrail> sampleTrails = [
  const ForestTrail(
    name: 'Whispering Pines Singletrack',
    difficulty: 'Intermediate (Blue)',
    distance: '7.8 km',
    elevation: '+320m',
    condition: 'Tacky Loam • Open',
    difficultyColor: Colors.blueAccent,
  ),
  const ForestTrail(
    name: 'Cedar Root Downhill Line',
    difficulty: 'Expert (Black Diamond)',
    distance: '4.2 km',
    elevation: '-540m',
    condition: 'Dry & Fast • Open',
    difficultyColor: Colors.black87,
  ),
  const ForestTrail(
    name: 'Emerald Fern Valley Loop',
    difficulty: 'Easy (Green Circle)',
    distance: '12.5 km',
    elevation: '+140m',
    condition: 'Clear Trail • Open',
    difficultyColor: Colors.green,
  ),
];

// ---------------------------------------------------------------------------
// MAIN NAVIGATION
// ---------------------------------------------------------------------------

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ExploreBikesPage(),
    ForestTrailsPage(),
    RentalPassPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFF1B3B22).withOpacity(0.12),
          onDestinationSelected: (index) => setState(() => _currentIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore, color: Color(0xFF1B3B22)),
              label: 'Explore Fleet',
            ),
            NavigationDestination(
              icon: Icon(Icons.terrain_outlined),
              selectedIcon: Icon(Icons.terrain, color: Color(0xFF1B3B22)),
              label: 'Forest Trails',
            ),
            NavigationDestination(
              icon: Icon(Icons.confirmation_number_outlined),
              selectedIcon: Icon(Icons.confirmation_number, color: Color(0xFF1B3B22)),
              label: 'Rental Pass',
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// EXPLORE FLEET PAGE
// ---------------------------------------------------------------------------

class ExploreBikesPage extends StatefulWidget {
  const ExploreBikesPage({super.key});

  @override
  State<ExploreBikesPage> createState() => _ExploreBikesPageState();
}

class _ExploreBikesPageState extends State<ExploreBikesPage> {
  BikeCategory _selectedCategory = BikeCategory.all;

  @override
  Widget build(BuildContext context) {
    final filteredBikes = _selectedCategory == BikeCategory.all
        ? sampleBikes
        : sampleBikes.where((b) => b.category == _selectedCategory).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'FOREST BIKES',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  fontSize: 18,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0F2415), Color(0xFF24482B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      bottom: -20,
                      child: Icon(
                        Icons.forest_rounded,
                        size: 200,
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      bottom: 50,
                      child: Text(
                        'Premium Trail & Enduro Fleet\nEngineered for the Deep Woods',
                        style: TextStyle(
                          color: Color(0xFFD6E3D8),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildCategoryChip('All Rigs', BikeCategory.all),
                    _buildCategoryChip('Trail', BikeCategory.trail),
                    _buildCategoryChip('Enduro', BikeCategory.enduro),
                    _buildCategoryChip('Downhill', BikeCategory.downhill),
                    _buildCategoryChip('E-MTB', BikeCategory.eBikes),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final bike = filteredBikes[index];
                  return BikeCard(bike: bike);
                },
                childCount: filteredBikes.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, BikeCategory category) {
    final isSelected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => setState(() => _selectedCategory = category),
        backgroundColor: Colors.white,
        selectedColor: const Color(0xFF1B3B22),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF2C392D),
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.transparent : const Color(0xFFD8E2D9),
          ),
        ),
      ),
    );
  }
}

class BikeCard extends StatelessWidget {
  final Bike bike;
  const BikeCard({super.key, required this.bike});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5EDE6)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1B3B22).withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _openDetailSheet(context, bike),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7EFE8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      bike.series.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1B3B22),
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\$${bike.dailyRate.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFC77846),
                      ),
                      children: const [
                        TextSpan(
                          text: ' / day',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6B726C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F7F4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.forest,
                        size: 90,
                        color: const Color(0xFF1B3B22).withOpacity(0.06),
                      ),
                      Icon(
                        bike.displayIcon,
                        size: 72,
                        color: const Color(0xFF1B3B22),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      bike.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A261C),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                      Text(
                        ' ${bike.rating}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Color(0xFF1A261C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _specBadge(Icons.straighten_rounded, bike.travel),
                  const SizedBox(width: 8),
                  _specBadge(Icons.fitness_center_rounded, bike.weight),
                  const Spacer(),
                  const Text(
                    'View Specs →',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1B3B22),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _specBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(icon, size: 13, color: const Color(0xFF436049)),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 11, color: Color(0xFF324637)),
          ),
        ],
      ),
    );
  }

  void _openDetailSheet(BuildContext context, Bike bike) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BikeDetailModal(bike: bike),
    );
  }
}

// ---------------------------------------------------------------------------
// DETAIL MODAL
// ---------------------------------------------------------------------------

class BikeDetailModal extends StatefulWidget {
  final Bike bike;
  const BikeDetailModal({super.key, required this.bike});

  @override
  State<BikeDetailModal> createState() => _BikeDetailModalState();
}

class _BikeDetailModalState extends State<BikeDetailModal> {
  int _rentalDays = 1;
  bool _includeHelmet = true;
  bool _includeTrailKit = false;

  double get totalPrice {
    double base = widget.bike.dailyRate * _rentalDays;
    if (_includeHelmet) base += (15 * _rentalDays);
    if (_includeTrailKit) base += 10;
    return base;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.bike.series.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        letterSpacing: 1.0,
                        color: Color(0xFFC77846),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      widget.bike.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1B3B22),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.bike.description,
            style: const TextStyle(color: Color(0xFF4C584E), height: 1.4),
          ),
          const SizedBox(height: 20),
          const Text(
            'CHASSIS & SUSPENSION SPECS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1B3B22),
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _specBox('Travel', widget.bike.travel),
              const SizedBox(width: 8),
              _specBox('Frame', widget.bike.frame),
              const SizedBox(width: 8),
              _specBox('Weight', widget.bike.weight),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'RENTAL DETAILS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1B3B22),
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Rental Duration:'),
              Row(
                children: [
                  IconButton.outlined(
                    onPressed: _rentalDays > 1
                        ? () => setState(() => _rentalDays--)
                        : null,
                    icon: const Icon(Icons.remove, size: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      '$_rentalDays ${_rentalDays == 1 ? 'Day' : 'Days'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: () => setState(() => _rentalDays++),
                    icon: const Icon(Icons.add, size: 16),
                  ),
                ],
              ),
            ],
          ),
          CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: const Text('Full-Face Enduro Helmet (+\$15/day)'),
            value: _includeHelmet,
            activeColor: const Color(0xFF1B3B22),
            onChanged: (v) => setState(() => _includeHelmet = v ?? false),
          ),
          CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: const Text('Forest Trail Pack & Tubeless Repair Kit (+\$10)'),
            value: _includeTrailKit,
            activeColor: const Color(0xFF1B3B22),
            onChanged: (v) => setState(() => _includeTrailKit = v ?? false),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 12),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFFE4EDE5))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('TOTAL ESTIMATE', style: TextStyle(fontSize: 10)),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1B3B22),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: const Color(0xFF1B3B22),
                        content: Text(
                          'Reserved ${widget.bike.name} for $_rentalDays day(s)! Check in at Trailhead Station #4.',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B3B22),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Book Forest Pass',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _specBox(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F7F4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            const SizedBox(height: 2),
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 11,
                color: Color(0xFF1B3B22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// TRAILS PAGE
// ---------------------------------------------------------------------------

class ForestTrailsPage extends StatelessWidget {
  const ForestTrailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PINE TRAILS NETWORK',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF1B3B22),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.nature_people_rounded, color: Colors.white, size: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Current Trail Status: Loamy & Prime. All north-ridge singletracks cleared of fallen timber.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'RECOMMENDED FOREST ROUTES',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF4C5E4E),
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 12),
          ...sampleTrails.map((trail) => _buildTrailCard(trail)),
        ],
      ),
    );
  }

  Widget _buildTrailCard(ForestTrail trail) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5EDE6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trail.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: Color(0xFF1B3B22),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: trail.difficultyColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  trail.difficulty,
                  style: TextStyle(
                    color: trail.difficultyColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _trailMetric(Icons.route_rounded, trail.distance),
              const SizedBox(width: 16),
              _trailMetric(Icons.landscape_rounded, trail.elevation),
              const SizedBox(width: 16),
              _trailMetric(Icons.water_drop_outlined, trail.condition),
            ],
          ),
        ],
      ),
    );
  }

  Widget _trailMetric(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF5A7D63)),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF4A5A4D)),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// RENTAL PASS PAGE
// ---------------------------------------------------------------------------

class RentalPassPage extends StatelessWidget {
  const RentalPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YOUR FOREST PASS',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFD6E2D8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.qr_code_2_rounded,
                      size: 140,
                      color: Color(0xFF1B3B22),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'STATION PICKUP CODE',
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: 1.5,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      'FRST-8492-MTB',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFC77846),
                      ),
                    ),
                    const Divider(height: 32),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Station Location:'),
                        Text(
                          'Bear Creek Lodge Hub',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rider Status:'),
                        Text(
                          'Waiver Signed ✅',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B3B22),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map_rounded),
                label: const Text('Open Forest Trailhead Map'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1B3B22),
                  side: const BorderSide(color: Color(0xFF1B3B22)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
