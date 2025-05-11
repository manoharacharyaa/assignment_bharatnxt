# Flutter Article App 
 
A Flutter app that fetches and displays a list of articles from a public 
API. 
 
## Features - List of articles - Search functionality - Detail view - Responsive UI 
 
## Setup Instructions 
1. Clone the repo
   i. git clone https://github.com/manoharacharyaa/assignment_bharatnxt.git
   ii. cd flutter_article_app
   iii. code . (open in vs code) 
 
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
The app uses Riverpod for state management, providing a clean and testable architecture. Providers are organized to separate data fetching, transformation, and UI state concerns. This approach enables efficient data flow from the API through repositories to the UI, with automatic rebuilding of only the affected widgets when state changes.

## Known Issues / Limitations 
1. Refresh functionality needs improvement to ensure fresh data is fetched from the API
2. Limited offline capabilities - app requires network connection for initial data load
3. No pagination implemented for large article sets
4. Error handling could be enhanced with more specific user feedback


 
## Screenshots

![Picsart_25-05-11_10-22-00-791](https://github.com/user-attachments/assets/92d4c3d2-3b8d-4b20-bcf5-5a42f1a98a2a)

![Picsart_25-05-11_10-24-39-381](https://github.com/user-attachments/assets/f5df12be-5487-46a5-ae33-6fe502cb5bd6)
