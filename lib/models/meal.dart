class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  const Meal(
      {this.id,
      this.categories,
      this.title,
      this.imageUrl,
      this.duration,
      this.ingredients,
      this.steps});
}
