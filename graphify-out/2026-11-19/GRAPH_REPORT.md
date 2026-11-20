# Graph Report - TrustedRoomie  (2026-11-13)

## Corpus Check
- Corpus is ~14,197 words - fits in a single context window. You may not need a graph.

## Summary
- 451 nodes · 914 edges · 15 communities
- Extraction: 91% EXTRACTED · 9% INFERRED · 0% AMBIGUOUS · INFERRED: 78 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Listing Detail Components & Scaffold
- Authentication Flow & Screens
- Explore View Toggle & Controls
- App Lifecycle & Navigation Routing
- Network Layer & Data Models
- Ratings, Chips & Card Components
- View Modifiers & Theme Styles
- Font Assets & Definitions
- Explore Listings & Navigation Graph
- Green Themed Cards & Buttons
- Typography & Font Tokens
- Listing Details & Photo Sections
- Beige Button Components
- Listing Location Section
- Text Input Form Controls

## God Nodes (most connected - your core abstractions)
1. `NavigationRouter` - 53 edges
2. `ExplorerView` - 18 edges
3. `RoomieTextStyle` - 18 edges
4. `RoomieTask` - 15 edges
5. `GreenCTAButton` - 14 edges
6. `StarRatingBar` - 13 edges
7. `DMSans` - 13 edges
8. `Observation` - 12 edges
9. `NetworkError` - 12 edges
10. `OnboardingRoute` - 12 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `BasicText`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/ListingLocationSection.swift → TrustedRoomie/Extensions/StringExt.swift
- `.body` --calls--> `BaseCard`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/BaseListingCardSection.swift → TrustedRoomie/UI/Components/Base/BaseCard.swift
- `.body` --calls--> `BaseCard`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/ListingPlaceReviews.swift → TrustedRoomie/UI/Components/Base/BaseCard.swift
- `.body` --calls--> `GreenCTAButton`  [INFERRED]
  TrustedRoomie/UI/Screen/ListingDetailScreen.swift → TrustedRoomie/UI/Components/Base/GreenCTAButton.swift
- `.body` --calls--> `Input`  [INFERRED]
  TrustedRoomie/UI/Components/Common/InputWithLabel.swift → TrustedRoomie/UI/Components/Common/Input.swift

## Import Cycles
- None detected.

## Communities (15 total, 0 thin omitted)

### Community 0 - "Listing Detail Components & Scaffold"
Cohesion: 0.07
Nodes (25): EmptyExampleView, .body, String, BaseScaffold, .body, ScreenTopBar, .body, BaseListingCardSection (+17 more)

### Community 1 - "Authentication Flow & Screens"
Cohesion: 0.07
Nodes (25): GreenCTAButton, .body, GreenCTAButtonStyle, InputWithLabel, .body, .body, OnboardingRoute, .id (+17 more)

### Community 2 - "Explore View Toggle & Controls"
Cohesion: 0.08
Nodes (23): ExplorerView, .id, list, map, HomeToggleButton, .body, PreviewContainer, .body (+15 more)

### Community 3 - "App Lifecycle & Navigation Routing"
Cohesion: 0.08
Nodes (13): Observation, SwiftUI, MyApp, .body, HomeScaffold, .body, AppNavigationDestinationModifier, View (+5 more)

### Community 4 - "Network Layer & Data Models"
Cohesion: 0.07
Nodes (16): Foundation, CodingKeys, completed, id, title, RoomieTask, NetworkError, decodingError (+8 more)

### Community 5 - "Ratings, Chips & Card Components"
Cohesion: 0.07
Nodes (15): BasicText, .body, BaseCard, .body, Chip, .body, .body, .body (+7 more)

### Community 6 - "View Modifiers & Theme Styles"
Cohesion: 0.10
Nodes (9): AppBackground, CardBackground, InlineNavigationTitleModifier, View, RoomieCardModifier, RoomieGlassCardModifier, RoomiePineButtonStyle, RoomiePrimaryButtonStyle (+1 more)

### Community 7 - "Font Assets & Definitions"
Cohesion: 0.10
Nodes (21): AppFont, DMSans, extraBold, extraLight, light, medium, .name, regular (+13 more)

### Community 8 - "Explore Listings & Navigation Graph"
Cohesion: 0.09
Nodes (17): ExploreList, Map, .body, ExploreListingCard, ListingCardItem, AppDestination, emptyExample, Home (+9 more)

### Community 9 - "Green Themed Cards & Buttons"
Cohesion: 0.10
Nodes (13): ContentView, .body, BaseGreenCard, .body, ListingGreenCard, .body, ListingPlaceReviews, .body (+5 more)

### Community 10 - "Typography & Font Tokens"
Cohesion: 0.11
Nodes (18): Font, RoomieFontTokens, RoomieTextStyle, bodyLarge, bodyMedium, displayLarge, displayMedium, .font (+10 more)

### Community 11 - "Listing Details & Photo Sections"
Cohesion: 0.15
Nodes (8): ListingInfoSection, .body, ListingPhotoSection, .body, ContactButton, .body, ListingDetailScreen, .body

### Community 12 - "Beige Button Components"
Cohesion: 0.28
Nodes (3): BeigeButton, .body, BeigeButtonStyle

### Community 13 - "Listing Location Section"
Cohesion: 0.25
Nodes (5): ListingLocationSection, .body, LocationInfoMessage, .body, .highlightedText

### Community 14 - "Text Input Form Controls"
Cohesion: 0.32
Nodes (3): Input, .body, .currentTextBinding

## Knowledge Gaps
- **72 isolated node(s):** `.body`, `id`, `title`, `completed`, `invalidURL` (+67 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 116 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `String` connect `Listing Detail Components & Scaffold` to `Authentication Flow & Screens`, `Explore View Toggle & Controls`, `App Lifecycle & Navigation Routing`, `Network Layer & Data Models`, `Ratings, Chips & Card Components`, `View Modifiers & Theme Styles`, `Font Assets & Definitions`, `Explore Listings & Navigation Graph`, `Green Themed Cards & Buttons`, `Listing Details & Photo Sections`, `Beige Button Components`, `Listing Location Section`, `Text Input Form Controls`?**
  _High betweenness centrality (0.445) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `NavigationRouter` (e.g. with `ContentView` and `NavigationScreen`) actually correct?**
  _`NavigationRouter` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `.body`, `id`, `title` to the rest of the system?**
  _72 weakly-connected nodes found - possible missing edges._
- **Should `Listing Detail Components & Scaffold` be split into smaller, more focused modules?**
  _Cohesion score 0.06612244897959184 - nodes in this community are weakly interconnected._
- **Why does `SwiftUI` connect `App Lifecycle & Navigation Routing` to `Listing Detail Components & Scaffold`, `Authentication Flow & Screens`, `Explore View Toggle & Controls`, `Ratings, Chips & Card Components`, `View Modifiers & Theme Styles`, `Font Assets & Definitions`, `Explore Listings & Navigation Graph`, `Green Themed Cards & Buttons`, `Typography & Font Tokens`, `Listing Details & Photo Sections`, `Beige Button Components`, `Listing Location Section`, `Text Input Form Controls`?**
  _High betweenness centrality (0.245) - this node is a cross-community bridge._
- **Should `Authentication Flow & Screens` be split into smaller, more focused modules?**
  _Cohesion score 0.06767676767676768 - nodes in this community are weakly interconnected._
- **Why does `NavigationRouter` connect `Authentication Flow & Screens` to `Listing Detail Components & Scaffold`, `Explore View Toggle & Controls`, `App Lifecycle & Navigation Routing`, `Ratings, Chips & Card Components`, `Explore Listings & Navigation Graph`, `Green Themed Cards & Buttons`, `Listing Details & Photo Sections`, `Beige Button Components`, `Listing Location Section`, `Text Input Form Controls`?**
  _High betweenness centrality (0.121) - this node is a cross-community bridge._