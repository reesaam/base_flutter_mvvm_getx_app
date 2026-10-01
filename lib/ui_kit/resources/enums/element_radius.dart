enum AppElementRadius {
  low(radius: 10),
  normal(radius: 20),
  high(radius: 30),
  zero(radius: 0);

  final double radius;
  const AppElementRadius({required this.radius});
}