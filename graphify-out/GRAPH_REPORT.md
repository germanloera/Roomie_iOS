# Graph Report - TrustedRoomie  (2026-11-19)

## Corpus Check
- 184 files · ~43,148 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 20 file(s) not represented in the graph (top: .ttf 13, .plist 2, (none) 1)

## Summary
- 1188 nodes · 2509 edges · 119 communities (55 shown, 64 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 288 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `85d35ac8`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- String
- InputWithLabel
- ExplorerView
- AppNavHost
- RoomieTask
- BasicText
- View Modifiers & Theme Styles
- Font Assets & Definitions
- ListingCardItem
- View
- Typography & Font Tokens
- Input
- BaseBottomSheet
- NavigationRouter
- SettingsRoute
- BaseSimpleButton
- HomeRoute
- ToggleChip
- PaymentPaymentsItem
- .body
- PublishAddPaymentSection
- HomeTabItem
- BaseListingCardSection
- Chip
- NotificationItemCard
- ChatBalloonLeft
- BottomCTAButton
- BottomSheetRoute
- GreenCTAButton
- Foundation
- SwiftUI
- BaseCard
- RoomieSectionHeader
- BeigeButton
- RoundCheckBox
- PublishAddSection
- SharedPaymentBottomSheet
- Color
- MonthlyPaymentItem
- PublishCurrentAddress
- UserType
- NetworkError
- SettingOptionItem
- HomeNavigationBar
- AddTaskItem
- PlannerDestination
- SwitchItem
- HomeGreenHeaderCard
- AddEventItem
- HomeTabsTenantLeaseholder
- LocationInfoMessage
- .body
- HomeScreen
- PaymentsDestination
- ProfileEmptyState
- PublishRules
- NetworkService
- BaseViewModel
- HomeScaffold
- BaseGreenCard
- PublishAdd
- PublishAmenities
- PublishNearbyPlaces
- EventItem
- TaskItem
- LoginScreen
- OnboardingRoute
- NotificationsScreen
- PrivacyScreen
- CodingKeys
- .body
- ChatTenantConversationCard
- ScreenTopBar
- ExploreMap
- HideListingItem
- PaymentIncidentItem
- RoomieListItem
- PasswordRecoveryConfirmationScreen
- ChangePasswordScreen
- PersonalInfoScreen
- PasswordRecoveryScreen
- SignInScreen
- RoomieShapes.swift

## God Nodes (most connected - your core abstractions)
1. `NavigationRouter` - 154 edges
2. `BaseCard` - 31 edges
3. `GreenCTAButton` - 20 edges
4. `InputWithLabel` - 20 edges
5. `BaseBottomSheet` - 18 edges
6. `Input` - 18 edges
7. `ListingCardItem` - 18 edges
8. `RoomieTextStyle` - 18 edges
9. `HomeTabItem` - 17 edges
10. `BottomSheetRoute` - 17 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `BaseCard`  [INFERRED]
  TrustedRoomie/UI/Base/BaseListingCardSection.swift → TrustedRoomie/UI/Components/Common/BaseCard.swift
- `.body` --calls--> `GreenCTAButton`  [INFERRED]
  TrustedRoomie/UI/Components/BottomSheets/NotifyPaymentBottomSheet.swift → TrustedRoomie/UI/Base/GreenCTAButton.swift
- `.body` --calls--> `BaseSimpleButton`  [INFERRED]
  TrustedRoomie/UI/Components/BottomSheets/DeleteListingBottomSheet.swift → TrustedRoomie/UI/Components/Common/BaseSimpleButton.swift
- `.body` --calls--> `BaseCard`  [INFERRED]
  TrustedRoomie/UI/Components/Common/SwitchItem.swift → TrustedRoomie/UI/Components/Common/BaseCard.swift
- `.body` --calls--> `BaseCard`  [INFERRED]
  TrustedRoomie/UI/Components/Home/NotificationItemCard.swift → TrustedRoomie/UI/Components/Common/BaseCard.swift

## Import Cycles
- None detected.

## Communities (119 total, 64 thin omitted)

### Community 0 - "String"
Cohesion: 0.20
Nodes (9): EmptyExampleView, String, ListingGreenCard, ApartmentHistoryItem, .id, ApartmentItem, .body, ProfileHistory (+1 more)

### Community 2 - "ExplorerView"
Cohesion: 0.10
Nodes (20): ExplorerHeader, .body, PreviewWrapper, .body, ExplorerView, .id, list, map (+12 more)

### Community 3 - "AppNavHost"
Cohesion: 0.17
Nodes (6): MyApp, .body, AppNavHost, .body, NavigationScreen, .body

### Community 5 - "BasicText"
Cohesion: 0.14
Nodes (6): BasicText, .body, RoomInfoPill, .body, .highlightedText, .body

### Community 6 - "View Modifiers & Theme Styles"
Cohesion: 0.10
Nodes (9): .body, DefaultButton, .body, DefaultButtonStyle, RoomieCardModifier, RoomieGlassCardModifier, RoomiePineButtonStyle, RoomiePrimaryButtonStyle (+1 more)

### Community 7 - "Font Assets & Definitions"
Cohesion: 0.10
Nodes (21): AppFont, DMSans, extraBold, extraLight, light, medium, .name, regular (+13 more)

### Community 8 - "ListingCardItem"
Cohesion: 0.06
Nodes (24): MapKit, Place, ExploreList, .body, ExploreListingCard, ListingCardItem, MapView, .body (+16 more)

### Community 9 - "View"
Cohesion: 0.70
Nodes (3): ContentView, .body, RoomieShapes

### Community 10 - "Typography & Font Tokens"
Cohesion: 0.07
Nodes (22): AppBackground, CardBackground, InlineNavigationTitleModifier, View, Font, RoomieFontTokens, RoomieTextStyle, bodyLarge (+14 more)

### Community 14 - "Input"
Cohesion: 0.09
Nodes (15): ChatMessageBox, .body, .currentTextBinding, Input, .body, .currentTextBinding, InputWithIcon, .body (+7 more)

### Community 15 - "BaseBottomSheet"
Cohesion: 0.06
Nodes (20): BaseBottomSheet, .body, View, DeleteListingBottomSheet, .body, .currentBinding, DeleteListingBottomSheetContent, .body (+12 more)

### Community 16 - "NavigationRouter"
Cohesion: 0.05
Nodes (20): BaseScaffold, .body, StarRatingBar, .body, .displayText, ListingPlaceReviews, .body, ListingReviewCard (+12 more)

### Community 17 - "SettingsRoute"
Cohesion: 0.07
Nodes (19): ProfileCurrentAddress, ProfileIsTenantInAddress, .body, .currentBinding, SettingsRoute, ChangePasswordScreen, .id, NotificationsScreen (+11 more)

### Community 18 - "BaseSimpleButton"
Cohesion: 0.08
Nodes (16): LogoutBottomSheet, .body, .currentBinding, LogoutBottomSheetContent, .body, .descriptionText, NotifyLeaveBottomSheet, .body (+8 more)

### Community 19 - "HomeRoute"
Cohesion: 0.08
Nodes (19): HomeRoute, Home, .id, LeaveRequest, ListingDetails, Messages, ProfilePublishPlace, RateRoomie (+11 more)

### Community 20 - "ToggleChip"
Cohesion: 0.10
Nodes (11): ToggleChip, .backgroundColor, .body, .currentBinding, .selectedValue, .textColor, FlowLayout, LeaveRequest (+3 more)

### Community 21 - "PaymentPaymentsItem"
Cohesion: 0.10
Nodes (11): PaymentPaymentsItem, .body, .titleFont, RoomiePaymentEntry, PaymentRoomieItem, .body, PaymentsIncidents, .body (+3 more)

### Community 22 - ".body"
Cohesion: 0.13
Nodes (9): ListingClosePlacesCard, .body, ListingPlaceItem, .body, ListingInfoSection, .body, ListingPhotoSection, .body (+1 more)

### Community 23 - "PublishAddPaymentSection"
Cohesion: 0.16
Nodes (5): PublishAddPaymentSection, .body, .currentItems, PublishSharedServices, .body

### Community 24 - "HomeTabItem"
Cohesion: 0.18
Nodes (13): HomeTabItem, HomeTabsRegistered, chats, explore, .id, .item, notifications, profile (+5 more)

### Community 25 - "BaseListingCardSection"
Cohesion: 0.14
Nodes (8): BaseListingCardSection, .body, ListingAmenitiesCard, .body, ListingRuleItem, .body, ListingRulesCard, .body

### Community 26 - "Chip"
Cohesion: 0.21
Nodes (10): Chip, .body, GlassChip, .body, GreenChip, .body, YellowChip, .body (+2 more)

### Community 27 - "NotificationItemCard"
Cohesion: 0.21
Nodes (6): NotificationItemCard, .body, NotificationsTab, .body, NotificationsTabContent, .body

### Community 28 - "ChatBalloonLeft"
Cohesion: 0.16
Nodes (8): ChatBalloonLeft, .balloonShape, .body, ChatBalloonRight, .balloonShape, .body, MessageScreen, .body

### Community 29 - "BottomCTAButton"
Cohesion: 0.19
Nodes (6): BottomCTAButton, .subtitleTextColor, SendInviteBottomBar, .body, .body, .body

### Community 30 - "BottomSheetRoute"
Cohesion: 0.14
Nodes (9): BottomSheetRoute, custom, deleteListing, .id, logout, notifyLeave, notifyPayment, sharedPayment (+1 more)

### Community 31 - "GreenCTAButton"
Cohesion: 0.24
Nodes (6): GreenCTAButton, .body, GreenCTAButtonStyle, RedCTAButton, .body, .body

### Community 32 - "Foundation"
Cohesion: 0.17
Nodes (9): Foundation, UiEvent, navigate, showSnackbar, UiState, error, idle, loading (+1 more)

### Community 34 - "BaseCard"
Cohesion: 0.17
Nodes (6): BaseCard, .body, ProfileContactSection, .body, UserCard, .body

### Community 35 - "RoomieSectionHeader"
Cohesion: 0.17
Nodes (6): LeavingRequestNotification, .body, RoomieSectionHeader, .body, RoomiesTab, .body

### Community 36 - "BeigeButton"
Cohesion: 0.21
Nodes (5): BeigeButton, .body, BeigeButtonStyle, .body, .body

### Community 37 - "RoundCheckBox"
Cohesion: 0.23
Nodes (6): RoundCheckBox, .body, .currentBgColor, .currentBinding, .currentBorderColor, .isChecked

### Community 38 - "PublishAddSection"
Cohesion: 0.24
Nodes (3): PublishAddSection, .body, .currentItems

### Community 39 - "SharedPaymentBottomSheet"
Cohesion: 0.29
Nodes (5): SharedPaymentBottomSheet, .body, .currentBinding, SharedPaymentBottomSheetContent, .body

### Community 40 - "Color"
Cohesion: 0.25
Nodes (4): LeaveRequestBottomBar, PublishButton, Color, .roomie

### Community 41 - "MonthlyPaymentItem"
Cohesion: 0.27
Nodes (6): ListingMonthlyPaymentCard, .body, ListingMonthlySectionItem, .body, MonthlyPaymentItem, .id

### Community 42 - "PublishCurrentAddress"
Cohesion: 0.20
Nodes (7): PublishCurrentAddress, .body, .currentAddress1, .currentAddress2, .currentCity, .currentState, .currentZipCode

### Community 43 - "UserType"
Cohesion: 0.20
Nodes (6): UserType, leaseholder, registered, tenant, unregistered, HomeTabs

### Community 44 - "NetworkError"
Cohesion: 0.20
Nodes (7): NetworkError, decodingError, .errorDescription, httpError, invalidResponse, invalidURL, unknown

### Community 45 - "SettingOptionItem"
Cohesion: 0.38
Nodes (5): SettingOptionItem, .body, SettingOptionItemContent, .body, .body

### Community 46 - "HomeNavigationBar"
Cohesion: 0.29
Nodes (3): HomeNavigationBar, .body, .selectedIndex

### Community 47 - "AddTaskItem"
Cohesion: 0.22
Nodes (5): AddTaskItem, .body, PlannerTasks, .body, .body

### Community 48 - "PlannerDestination"
Cohesion: 0.28
Nodes (6): PlannerDestination, events, .id, .label, tasks, PlannerScreen

### Community 49 - "SwitchItem"
Cohesion: 0.33
Nodes (3): SwitchItem, .body, .currentBinding

### Community 50 - "HomeGreenHeaderCard"
Cohesion: 0.25
Nodes (4): HomeGreenHeaderCard, .body, HomeTab, .body

### Community 51 - "AddEventItem"
Cohesion: 0.25
Nodes (4): AddEventItem, .body, PlannerEventTab, .body

### Community 52 - "HomeTabsTenantLeaseholder"
Cohesion: 0.25
Nodes (8): HomeTabsTenantLeaseholder, home, .id, .item, payments, planner, profile, roomies

### Community 53 - "LocationInfoMessage"
Cohesion: 0.29
Nodes (4): ListingLocationSection, .body, LocationInfoMessage, .highlightedText

### Community 54 - ".body"
Cohesion: 0.25
Nodes (3): PublishListingInfo, .body, .body

### Community 55 - "HomeScreen"
Cohesion: 0.39
Nodes (3): HomeScreen, .body, HomeViewModel

### Community 56 - "PaymentsDestination"
Cohesion: 0.32
Nodes (6): PaymentsDestination, .id, incidents, .label, services, PaymentsScreen

### Community 57 - "ProfileEmptyState"
Cohesion: 0.29
Nodes (4): ProfileEmptyState, .body, ProfileTab, .body

### Community 62 - "BaseGreenCard"
Cohesion: 0.40
Nodes (3): BaseGreenCard, .body, .body

### Community 69 - "OnboardingRoute"
Cohesion: 0.33
Nodes (6): OnboardingRoute, .id, Login, PasswordRecovery, PasswordRecoveryConfirmation, SignIn

### Community 72 - "CodingKeys"
Cohesion: 0.40
Nodes (4): CodingKeys, completed, id, title

## Knowledge Gaps
- **162 isolated node(s):** `unregistered`, `registered`, `tenant`, `leaseholder`, `explore` (+157 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 289 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **64 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `String` connect `String` to `InputWithLabel`, `ExplorerView`, `RoomieTask`, `BasicText`, `View Modifiers & Theme Styles`, `Font Assets & Definitions`, `ListingCardItem`, `View`, `Typography & Font Tokens`, `Input`, `BaseBottomSheet`, `NavigationRouter`, `SettingsRoute`, `BaseSimpleButton`, `HomeRoute`, `ToggleChip`, `PaymentPaymentsItem`, `.body`, `PublishAddPaymentSection`, `HomeTabItem`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `BottomSheetRoute`, `GreenCTAButton`, `Foundation`, `BaseCard`, `RoomieSectionHeader`, `BeigeButton`, `PublishAddSection`, `SharedPaymentBottomSheet`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `UserType`, `NetworkError`, `SettingOptionItem`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `HomeGreenHeaderCard`, `AddEventItem`, `LocationInfoMessage`, `.body`, `PaymentsDestination`, `ProfileEmptyState`, `PublishRules`, `NetworkService`, `HomeScaffold`, `PublishAdd`, `PublishAmenities`, `PublishNearbyPlaces`, `EventItem`, `TaskItem`, `LoginScreen`, `OnboardingRoute`, `CodingKeys`, `ChatTenantConversationCard`, `ScreenTopBar`, `HideListingItem`, `PaymentIncidentItem`, `RoomieListItem`, `PasswordRecoveryConfirmationScreen`, `ChangePasswordScreen`, `PersonalInfoScreen`, `PasswordRecoveryScreen`, `SignInScreen`?**
  _High betweenness centrality (0.419) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `NavigationRouter` (e.g. with `ContentView` and `AppNavHost`) actually correct?**
  _`NavigationRouter` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `unregistered`, `registered`, `tenant` to the rest of the system?**
  _162 weakly-connected nodes found - possible missing edges._
- **Should `ExplorerView` be split into smaller, more focused modules?**
  _Cohesion score 0.09659090909090909 - nodes in this community are weakly interconnected._
- **Why does `NavigationRouter` connect `NavigationRouter` to `String`, `InputWithLabel`, `ExplorerView`, `AppNavHost`, `BasicText`, `ListingCardItem`, `View`, `Input`, `BaseBottomSheet`, `SettingsRoute`, `BaseSimpleButton`, `HomeRoute`, `ToggleChip`, `PaymentPaymentsItem`, `.body`, `PublishAddPaymentSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `BottomSheetRoute`, `GreenCTAButton`, `SwiftUI`, `BaseCard`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `PublishAddSection`, `SharedPaymentBottomSheet`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `SettingOptionItem`, `HomeNavigationBar`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `HomeGreenHeaderCard`, `AddEventItem`, `LocationInfoMessage`, `.body`, `HomeScreen`, `PaymentsDestination`, `ProfileEmptyState`, `PublishRules`, `HomeScaffold`, `BaseGreenCard`, `PublishAdd`, `PublishAmenities`, `PublishNearbyPlaces`, `EventItem`, `TaskItem`, `LoginScreen`, `NotificationsScreen`, `PrivacyScreen`, `ChatTenantConversationCard`, `ScreenTopBar`, `ExploreMap`, `HideListingItem`, `PaymentIncidentItem`, `RoomieListItem`, `PasswordRecoveryConfirmationScreen`, `ChangePasswordScreen`, `PersonalInfoScreen`, `PasswordRecoveryScreen`, `SignInScreen`?**
  _High betweenness centrality (0.164) - this node is a cross-community bridge._
- **Should `BasicText` be split into smaller, more focused modules?**
  _Cohesion score 0.14285714285714285 - nodes in this community are weakly interconnected._
- **Why does `SwiftUI` connect `SwiftUI` to `String`, `InputWithLabel`, `ExplorerView`, `AppNavHost`, `BasicText`, `View Modifiers & Theme Styles`, `Font Assets & Definitions`, `ListingCardItem`, `Typography & Font Tokens`, `Input`, `BaseBottomSheet`, `NavigationRouter`, `SettingsRoute`, `BaseSimpleButton`, `HomeRoute`, `ToggleChip`, `PaymentPaymentsItem`, `.body`, `PublishAddPaymentSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `GreenCTAButton`, `BaseCard`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `PublishAddSection`, `SharedPaymentBottomSheet`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `UserType`, `SettingOptionItem`, `HomeNavigationBar`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `HomeGreenHeaderCard`, `AddEventItem`, `LocationInfoMessage`, `.body`, `HomeScreen`, `PaymentsDestination`, `ProfileEmptyState`, `PublishRules`, `HomeScaffold`, `BaseGreenCard`, `PublishAdd`, `PublishAmenities`, `PublishNearbyPlaces`, `EventItem`, `TaskItem`, `LoginScreen`, `NotificationsScreen`, `PrivacyScreen`, `ChatTenantConversationCard`, `ScreenTopBar`, `ExploreMap`, `HideListingItem`, `PaymentIncidentItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `RoomieShapes.swift`?**
  _High betweenness centrality (0.156) - this node is a cross-community bridge._