import 'package:flutter/material.dart';
import 'package:github/controller/connectivity_controller.dart';
import 'package:github/views/profile_view/profile_page.dart';
import 'package:provider/provider.dart';
import '../../controller/home_controller.dart';
import '../../helpers/colors.dart';
import '../../helpers/style.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of <CheckconnectivityProvider>(context).getInternetConnectivity(context);
    final user = Provider.of<Homecontroller>(context, listen: false);
    return Scaffold(
      backgroundColor: Colorss.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        backgroundColor: Colorss.black,
        centerTitle: true,
        title: TextFormField(
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Profile(
                    user: user.searched,
                  );
                },
              ));
              // GithubDataNotifier().fetchGithubData(searched);
              user.searchcontroller.clear();
            }
            user.searched = value;
          },
          controller: user.searchcontroller,
          decoration: InputDecoration(
              hintText: 'Enter User Name',
              prefixIcon: const Icon(
                Icons.search,
              ),
              filled: true,
              fillColor: Colorss.white, // Background color
              contentPadding: const EdgeInsets.all(12), // Adjust the padding
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colorss.green), // Change the focused border color
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.grey), // Change the enabled border color
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                  onPressed: user.clearsearch,
                  icon: const Icon(
                    Icons.clear,
                    color: Colorss.black,
                  ))),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    child: Image.network(
                        'https://blog.geekhunter.com.br/wp-content/uploads/2017/08/github-768x384.png'),
                    backgroundColor: Colors.black,
                    radius: 120,
                  ),
                ),
                Text("What is GitHub ?", style: Styless.greenTextStyle),
                Text(
                  "GitHub is an essential tool for software developers and professionals, bringing a touch of professionalism to their workflows.",
                  style: Styless.whiteTextStyle,
                ),
                const SizedBox(height: 16.0),
                Text("Usage", style: Styless.greenTextStyle),
                Text(
                  "GitHub is primarily used for version control, collaboration, and code management. It allows professionals to store, track changes, and collaborate on their software projects. This ensures code quality and streamlines the development process.",
                  style: Styless.whiteTextStyle,
                ),
                const SizedBox(height: 16.0),
                Text("Main Parts", style: Styless.greenTextStyle),
                Text(
                  "1. Repositories: These are like folders for your projects. They contain all the project files and keep track of changes over time. This is where the code resides.",
                  style: Styless.whiteTextStyle,
                ),
                Text(
                  "2. Commits: A commit is a snapshot of the project at a particular point in time. Developers use commits to record changes they've made, along with a brief description of what those changes are.",
                  style: Styless.whiteTextStyle,
                ),
                Text(
                  "3. Branches: Branches are different lines of development within a repository. They allow professionals to work on new features or bug fixes without affecting the main codebase.",
                  style: Styless.whiteTextStyle,
                ),
                Text(
                  "4. Pull Requests: When a developer wants to merge their changes from a branch into the main codebase, they create a pull request. This is a request for the project maintainers to review and approve their changes.",
                  style: Styless.whiteTextStyle,
                ),
                Text(
                  "5. Issues: These are used to track bugs, feature requests, and other tasks related to the project. They provide a structured way to manage and discuss work that needs to be done.",
                  style: Styless.whiteTextStyle,
                ),
                const SizedBox(height: 16.0),
                Text(
                    "What is GitHub's primary purpose in a professional context?",
                    style: Styless.greenTextStyle),
                Text(
                  "GitHub serves as a central hub for version control, enabling professionals to collaboratively manage and track changes in their software projects, ensuring code quality and facilitating efficient development.",
                  style: Styless.whiteTextStyle,
                ),
                const SizedBox(height: 16.0),
                Text(
                    "What are the main components of GitHub that professionals commonly interact with?",
                    style: Styless.greenTextStyle),
                Text(
                  " Professionals on GitHub commonly work with repositories (storing code), commits (recording changes), branches (isolated development lines), pull requests (merging code changes), and issues (managing tasks and discussions).",
                  style: Styless.whiteTextStyle,
                ),
                const SizedBox(height: 16.0),
                Text(
                    "How does GitHub contribute to a more professional and organized approach to software development?",
                    style: Styless.greenTextStyle),
                Text(
                  "GitHub enhances professionalism by providing a structured platform for version control and collaboration, ensuring that software development is organized, well-documented, and efficient.",
                  style: Styless.whiteTextStyle,
                ),
                const SizedBox(height: 16.0),
                Text(
                    "Can you explain the role of a 'pull request' in a professional context on GitHub?",
                    style: Styless.greenTextStyle),
                Text(
                  "A pull request is a formal request for code changes to be reviewed and merged into the main project. It allows professionals to ensure code quality, collaboration, and coordination in a controlled and professional manner.",
                  style: Styless.whiteTextStyle,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "In summary, GitHub adds a professional touch to software development by offering version control, collaboration, and organization. Its key components like repositories, commits, branches, pull requests, and issues help professionals manage their projects effectively and efficiently.",
                  style: Styless.whiteTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
