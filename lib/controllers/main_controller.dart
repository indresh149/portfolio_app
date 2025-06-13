import 'package:get/get.dart';
import '../models/project_model.dart';

class MainController extends GetxController {
  var selectedIndex = 1.obs;
  var selectedTabIndex = 0.obs;
  var searchQuery = ''.obs;

  final List<ProjectModel> allProjects = [
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project1.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project2.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project3.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project4.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
    ProjectModel(
      title: 'Kemampuan Merangkum Tulisan',
      subtitle: 'BAHASA SUNDA',
      author: 'Oleh Al-Baqi Samaan',
      grade: 'A',
      imagePath: 'assets/images/project5.jpg',
    ),
  ];

  List<ProjectModel> get filteredProjects {
    if (searchQuery.value.isEmpty) {
      return allProjects;
    }
    return allProjects
        .where(
          (project) =>
              project.title.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ) ||
              project.subtitle.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ),
        )
        .toList();
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  void changePortfolioTab(int index) {
    selectedTabIndex.value = index;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
