# Flutter Article App 
 
A Flutter app that fetches and displays a list of articles from a public 
API. 
 
## Features - List of articles - Search functionality - Detail view - Responsive UI 
 
## Setup Instructions 
1. Clone the repo
   git clone https://github.com/manoharacharyaa/assignment_bharatnxt.git
   cd flutter_article_app
   code . 
 
3. Install dependencies: 
   flutter pub get 
 
4. Run the app: 
   flutter run 
 
## Tech Stack  
1. Flutter SDK: 3.29.2
2. State Management: flutter_riverpod
3. HTTP Client: dio
4. Persistence: shared_preferences
5. Routing: go_router
6. Webview: webview_flutter
7. Serialization: freezed
 
 
 
## State Management Explanation 
The app uses Riverpod for state management, providing a clean and testable architecture. Providers are organized to separate data fetch![Screenshot_1746936878](https://github.com/user-attachments/assets/2143fd15-674b-4594-8481-74c4c637897e)
ing, transformation, and UI state concerns. This approach enables efficient data flow from the API through repositories to the UI, with automatic rebuilding of only the affected widgets when state changes.
 ![Screenshot_1746936862](https://github.com/user-attachments/assets/3c1f414f-05fc-4c9e-9dd3-98d574a3b916)

## Known Issues / Limitations 
1. Refresh functionality needs improvement to ensure fresh data is fetched from the API![Screenshot_1746936897](https://github.com/user![Screenshot_1746936912](https://github.com/user-attachments/assets/476556ac-23ab-4ebe-8f2f-5e5585668d0f)
-attachments/assets/f811d2f4-136b-4080-81b0-368d4dcfc5b0)

2. Limited offline capabilities - app requires network connection for initial data load
3. No pagination implemented for large article sets
4. Error handling could be enhanced with more specific user feedback![Screenshot_1746936883](https://github.com/user-attachments/assets/ff24ee2e-3aeb-4e2a-94d1-fbf6326ba95e)


 
## Screenshots (Optional) ![Screenshot_1746936854](https://github.com/user-attachments/assets/fbab480d-aa72-4f74-8873-e6adbf3bd379)

[Add if applicable] 
