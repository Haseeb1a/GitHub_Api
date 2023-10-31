import 'package:flutter/material.dart';
import 'package:github/views/userview.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searched = "kpmajid";
    final TextEditingController searchcontroller = TextEditingController();
    clearsearch() {
      searchcontroller.clear();
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        // backgroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: TextFormField(
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return WeatherView(
                    user: searched,
                  );
                },
              ));
              searchcontroller.clear();
            }
            searched = value;
          },
          controller: searchcontroller,
          decoration: InputDecoration(
              hintText: 'Enter User Name',
              prefixIcon: Icon(
                Icons.search,
              ),
              filled: true,
              fillColor: Colors.white, // Background color
              contentPadding: EdgeInsets.all(12), // Adjust the padding
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.green), // Change the focused border color
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey), // Change the enabled border color
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                  onPressed: clearsearch,
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ))),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CircleAvatar(
                  child: Image.network(
                      'https://blog.geekhunter.com.br/wp-content/uploads/2017/08/github-768x384.png'),
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  radius: 120,
                ),
                Text(
                  '''Certainly, here's the entire statement in a stylish and structured format:

**Statement:**
GitHub is an essential tool for software developers and professionals, bringing a touch of professionalism to their workflows.

**Usage:**
GitHub is primarily used for version control, collaboration, and code management. It allows professionals to store, track changes, and collaborate on their software projects. This ensures code quality and streamlines the development process.

**Main Parts:**
1. **Repositories:** These are like folders for your projects. They contain all the project files and keep track of changes over time. This is where the code resides.

2. **Commits:** A commit is a snapshot of the project at a particular point in time. Developers use commits to record changes they've made, along with a brief description of what those changes are.

3. **Branches:** Branches are different lines of development within a repository. They allow professionals to work on new features or bug fixes without affecting the main codebase.

4. **Pull Requests:** When a developer wants to merge their changes from a branch into the main codebase, they create a pull request. This is a request for the project maintainers to review and approve their changes.

5. **Issues:** These are used to track bugs, feature requests, and other tasks related to the project. They provide a structured way to manage and discuss work that needs to be done.

**Question-Answer Style:**

**Q1:** What is GitHub's primary purpose in a professional context?

**A1:** GitHub serves as a central hub for version control, enabling professionals to collaboratively manage and track changes in their software projects, ensuring code quality and facilitating efficient development.

**Q2:** What are the main components of GitHub that professionals commonly interact with?

**A2:** Professionals on GitHub commonly work with repositories (storing code), commits (recording changes), branches (isolated development lines), pull requests (merging code changes), and issues (managing tasks and discussions).

**Q3:** How does GitHub contribute to a more professional and organized approach to software development?

**A3:** GitHub enhances professionalism by providing a structured platform for version control and collaboration, ensuring that software development is organized, well-documented, and efficient.

**Q4:** Can you explain the role of a "pull request" in a professional context on GitHub?

**A4:** A pull request is a formal request for code changes to be reviewed and merged into the main project. It allows professionals to ensure code quality, collaboration, and coordination in a controlled and professional manner.

In summary, GitHub adds a professional touch to software development by offering version control, collaboration, and organization. Its key components like repositories, commits, branches, pull requests, and issues help professionals manage their projects effectively and efficiently.''',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
