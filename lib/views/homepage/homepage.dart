import 'package:flutter/material.dart';
import 'package:github/views/profileview/profilepage.dart';
import 'package:provider/provider.dart';

import '../../controller/homecontroller copy.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String searched = "kpmajid";
    // final TextEditingController searchcontroller = TextEditingController();
    // clearsearch() {
    //   searchcontroller.clear();
    // }
     const TextStyle whiteTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontStyle: FontStyle.italic // Set text color to white
    );
         const TextStyle greenTextStyle  = TextStyle(
      fontWeight: FontWeight.bold,
              fontSize: 18,
      color: Colors.green, 
       fontStyle: FontStyle.italic 
      
      // Set text color to white
    );
    final user = Provider.of<Homecontroller>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        // backgroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: TextFormField(
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return WeatherView(
                    user: user.searched,
                  );
                },
              ));
              // GithubDataNotifier().fetchGithubData(searched);
             user. searchcontroller.clear();
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
              fillColor: Colors.white, // Background color
              contentPadding: const EdgeInsets.all(12), // Adjust the padding
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.green), // Change the focused border color
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.grey), // Change the enabled border color
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                  onPressed:user. clearsearch,
                  icon: const Icon(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    child: Image.network(
                        'https://blog.geekhunter.com.br/wp-content/uploads/2017/08/github-768x384.png'),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    radius: 120,
                  ),
                ),
           const Text(
            "What is GitHub ?",
            style: greenTextStyle
          ),
          const Text(
            "GitHub is an essential tool for software developers and professionals, bringing a touch of professionalism to their workflows.",
            style: whiteTextStyle,
          ),
          const SizedBox(height: 16.0),
          const Text(
            "Usage",
            style: greenTextStyle
          ),
          const Text(
            "GitHub is primarily used for version control, collaboration, and code management. It allows professionals to store, track changes, and collaborate on their software projects. This ensures code quality and streamlines the development process.",
            style: whiteTextStyle,
          ),
          const SizedBox(height: 16.0),
          const Text(
            "Main Parts",
            style: greenTextStyle
          ),
          const Text(
            "1. Repositories: These are like folders for your projects. They contain all the project files and keep track of changes over time. This is where the code resides.",
            style: whiteTextStyle,
          ),
          const Text(
            "2. Commits: A commit is a snapshot of the project at a particular point in time. Developers use commits to record changes they've made, along with a brief description of what those changes are.",
            style: whiteTextStyle,
          ),
          const Text(
            "3. Branches: Branches are different lines of development within a repository. They allow professionals to work on new features or bug fixes without affecting the main codebase.",
            style: whiteTextStyle,
          ),
          const Text(
            "4. Pull Requests: When a developer wants to merge their changes from a branch into the main codebase, they create a pull request. This is a request for the project maintainers to review and approve their changes.",
            style: whiteTextStyle,
          ),
          const Text(
            "5. Issues: These are used to track bugs, feature requests, and other tasks related to the project. They provide a structured way to manage and discuss work that needs to be done.",
            style: whiteTextStyle,
          ),
          const SizedBox(height: 16.0),
          const Text(
            "What is GitHub's primary purpose in a professional context?",
            style: greenTextStyle
          ),
          const Text(
            "GitHub serves as a central hub for version control, enabling professionals to collaboratively manage and track changes in their software projects, ensuring code quality and facilitating efficient development.",
            style: whiteTextStyle,
          ),
           const SizedBox(height: 16.0),
          const Text(
            "What are the main components of GitHub that professionals commonly interact with?",
            style: greenTextStyle
          ),
          const Text(
            " Professionals on GitHub commonly work with repositories (storing code), commits (recording changes), branches (isolated development lines), pull requests (merging code changes), and issues (managing tasks and discussions).",
            style: whiteTextStyle,
          ),
           const SizedBox(height: 16.0),
          const Text(
            " How does GitHub contribute to a more professional and organized approach to software development?",
            style: greenTextStyle
          ),
          const Text(
            " GitHub enhances professionalism by providing a structured platform for version control and collaboration, ensuring that software development is organized, well-documented, and efficient.",
            style: whiteTextStyle,
          ),
          const SizedBox(height: 16.0),
          const Text(
            " Can you explain the role of a 'pull request' in a professional context on GitHub?",
            style: greenTextStyle
          ),
          const Text(
            " A pull request is a formal request for code changes to be reviewed and merged into the main project. It allows professionals to ensure code quality, collaboration, and coordination in a controlled and professional manner.",
            style: whiteTextStyle,
          ),
          const SizedBox(height: 16.0),
          const Text(
            "In summary, GitHub adds a professional touch to software development by offering version control, collaboration, and organization. Its key components like repositories, commits, branches, pull requests, and issues help professionals manage their projects effectively and efficiently.",
            style: whiteTextStyle,
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
