# Graph Report - TrustedRoomie  (2026-11-20)

## Corpus Check
- 189 files · ~43,145 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 21 file(s) not represented in the graph (top: .ttf 13, (none) 2, .plist 2)

## Summary
- 1213 nodes · 2528 edges · 129 communities (62 shown, 67 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 291 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `5dcc1925`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- String
- InputWithLabel
- ExplorerView
- AppNavHost
- RoomieTask
- StarRatingBar
- ButtonStyle
- Font Assets & Definitions
- ListingCardItem
- View
- Typography & Font Tokens
- Input
- BaseBottomSheet
- ListingReviewCard
- SettingsRoute
- BaseSimpleButton
- ChatTenantConversationCard
- ToggleChip
- PaymentPaymentsItem
- ListingClosePlacesCard
- PublishAddSection
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
- String
- RoomieSectionHeader
- BeigeButton
- RoundCheckBox
- DeleteListingBottomSheet
- SharedPaymentBottomSheet
- Color
- MonthlyPaymentItem
- PublishCurrentAddress
- ScreenConfig
- UpdateRentBottomSheet
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
- .body
- View
- DefaultButton
- HomeTabHeader
- ProfileIsTenantInAddress
- HomeScaffold
- BaseGreenCard
- .body
- PublishAmenities
- PublishNearbyPlaces
- EventItem
- BaseCard
- PasswordRecoveryConfirmationScreen
- OnboardingRoute
- NotificationsScreen
- PrivacyScreen
- RoomieTheme.swift
- .body
- RoomieColorTokens
- NavigationRouter
- ExploreMap
- HideListingItem
- PaymentIncidentItem
- RoomieListItem
- ChangePasswordScreen
- PersonalInfoScreen
- CardBackground
- InlineNavigationTitleModifier
- Foundation
- ViewModifier
- .body
- PublishPhotoItems
- PublishSharedServices
- PaymentRoomieItem
- ProfileReviewsSection
- RoomieSectionHeader

## God Nodes (most connected - your core abstractions)
1. `NavigationRouter` - 154 edges
2. `BaseCard` - 31 edges
3. `InputWithLabel` - 20 edges
4. `GreenCTAButton` - 20 edges
5. `HomeRoute` - 18 edges
6. `RoomieTextStyle` - 18 edges
7. `Input` - 18 edges
8. `BaseBottomSheet` - 18 edges
9. `ListingCardItem` - 18 edges
10. `HomeTabItem` - 17 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `PaymentPaymentsItem`  [INFERRED]
  TrustedRoomie/UI/Components/Payments/PaymentsServicesTab.swift → TrustedRoomie/UI/Components/Payments/Items/PaymentPaymentsItem.swift
- `.body` --calls--> `HomeScreen`  [INFERRED]
  TrustedRoomie/UI/Navigation/AppNavHost.swift → TrustedRoomie/UI/Screen/Home/HomeScreen.swift
- `.body` --calls--> `HomeTabs`  [INFERRED]
  TrustedRoomie/UI/Screen/Home/HomeScreen.swift → TrustedRoomie/UI/Screen/Home/Tabs/HomeTabs.swift
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Screen/Settings/ChangePasswordScreen.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/Publish/PublishListingInfo.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift

## Import Cycles
- None detected.

## Communities (129 total, 67 thin omitted)

### Community 0 - "String"
Cohesion: 0.29
Nodes (6): ApartmentHistoryItem, .id, ApartmentItem, .body, ProfileHistory, .body

### Community 1 - "InputWithLabel"
Cohesion: 0.21
Nodes (4): InputWithLabel, .body, SignInScreen, .body

### Community 2 - "ExplorerView"
Cohesion: 0.21
Nodes (10): ExplorerView, .id, list, map, HomeToggleButton, .body, PreviewContainer, .body (+2 more)

### Community 3 - "AppNavHost"
Cohesion: 0.17
Nodes (6): MyApp, .body, AppNavHost, .body, NavigationScreen, .body

### Community 4 - "RoomieTask"
Cohesion: 0.07
Nodes (19): ContentView, .body, CodingKeys, completed, id, title, RoomieTask, NetworkError (+11 more)

### Community 5 - "StarRatingBar"
Cohesion: 0.08
Nodes (11): BasicText, .body, RoomInfoPill, .body, .highlightedText, StarRatingBar, .body, .displayText (+3 more)

### Community 6 - "ButtonStyle"
Cohesion: 0.21
Nodes (3): .body, RoomiePineButtonStyle, RoomiePrimaryButtonStyle

### Community 7 - "Font Assets & Definitions"
Cohesion: 0.10
Nodes (21): AppFont, DMSans, extraBold, extraLight, light, medium, .name, regular (+13 more)

### Community 8 - "ListingCardItem"
Cohesion: 0.05
Nodes (28): BaseScaffold, .body, ExploreList, .body, ExploreListingCard, ListingCardItem, MapView, .body (+20 more)

### Community 9 - "View"
Cohesion: 0.24
Nodes (6): ExplorerHeader, .body, PreviewWrapper, .body, RoomiePalette, .ScreenBgBrush

### Community 10 - "Typography & Font Tokens"
Cohesion: 0.11
Nodes (18): Font, RoomieFontTokens, RoomieTextStyle, bodyLarge, bodyMedium, displayLarge, displayMedium, .font (+10 more)

### Community 14 - "Input"
Cohesion: 0.13
Nodes (11): Input, .body, .currentTextBinding, InputWithIcon, .body, .currentTextBinding, PublishAddMultipleText, .body (+3 more)

### Community 15 - "BaseBottomSheet"
Cohesion: 0.26
Nodes (3): BaseBottomSheet, .body, View

### Community 16 - "ListingReviewCard"
Cohesion: 0.21
Nodes (6): ListingPlaceReviews, .body, ListingReviewCard, .highlightedText, ListingTenantReview, .body

### Community 17 - "SettingsRoute"
Cohesion: 0.10
Nodes (14): SettingsRoute, ChangePasswordScreen, .id, NotificationsScreen, PersonalInfoScreen, PrivacyScreen, Settings, View (+6 more)

### Community 18 - "BaseSimpleButton"
Cohesion: 0.09
Nodes (14): LogoutBottomSheet, .body, .currentBinding, LogoutBottomSheetContent, .body, .descriptionText, NotifyLeaveBottomSheet, .body (+6 more)

### Community 19 - "ChatTenantConversationCard"
Cohesion: 0.21
Nodes (6): ChatTenantConversationCard, .body, ChatTab, .body, ChatTabContent, .body

### Community 20 - "ToggleChip"
Cohesion: 0.10
Nodes (11): ToggleChip, .backgroundColor, .body, .currentBinding, .selectedValue, .textColor, FlowLayout, LeaveRequest (+3 more)

### Community 21 - "PaymentPaymentsItem"
Cohesion: 0.27
Nodes (4): PaymentPaymentsItem, .body, .titleFont, RoomiePaymentEntry

### Community 22 - "ListingClosePlacesCard"
Cohesion: 0.33
Nodes (4): ListingClosePlacesCard, .body, ListingPlaceItem, .body

### Community 23 - "PublishAddSection"
Cohesion: 0.07
Nodes (11): PublishAdd, .body, PublishAddPaymentSection, .body, .currentItems, PublishAddSection, .body, .currentItems (+3 more)

### Community 24 - "HomeTabItem"
Cohesion: 0.18
Nodes (13): HomeTabItem, HomeTabsRegistered, chats, explore, .id, .item, notifications, profile (+5 more)

### Community 25 - "BaseListingCardSection"
Cohesion: 0.14
Nodes (8): BaseListingCardSection, .body, ListingAmenitiesCard, .body, ListingRuleItem, .body, ListingRulesCard, .body

### Community 26 - "Chip"
Cohesion: 0.20
Nodes (10): Chip, .body, GlassChip, .body, GreenChip, .body, YellowChip, .body (+2 more)

### Community 27 - "NotificationItemCard"
Cohesion: 0.21
Nodes (6): NotificationItemCard, .body, NotificationsTab, .body, NotificationsTabContent, .body

### Community 28 - "ChatBalloonLeft"
Cohesion: 0.11
Nodes (11): ChatBalloonLeft, .balloonShape, .body, ChatBalloonRight, .balloonShape, .body, ChatMessageBox, .body (+3 more)

### Community 29 - "BottomCTAButton"
Cohesion: 0.10
Nodes (11): BottomCTAButton, .subtitleTextColor, ScreenTopBar, .body, .body, .body, .body, RateItem (+3 more)

### Community 30 - "BottomSheetRoute"
Cohesion: 0.17
Nodes (9): BottomSheetRoute, custom, deleteListing, .id, logout, notifyLeave, notifyPayment, sharedPayment (+1 more)

### Community 31 - "GreenCTAButton"
Cohesion: 0.09
Nodes (15): GreenCTAButton, .body, GreenCTAButtonStyle, RedCTAButton, .body, NotifyPaymentBottomSheet, .body, .currentBinding (+7 more)

### Community 32 - "Foundation"
Cohesion: 0.13
Nodes (9): BaseViewModel, UiEvent, navigate, showSnackbar, UiState, error, idle, loading (+1 more)

### Community 34 - "String"
Cohesion: 0.14
Nodes (10): EmptyExampleView, String, ProfileContactSection, .body, ProfileCurrentAddress, ProfilePublishPlaceItem, .body, UserCard (+2 more)

### Community 35 - "RoomieSectionHeader"
Cohesion: 0.25
Nodes (4): LeavingRequestNotification, .body, RoomiesTab, .body

### Community 36 - "BeigeButton"
Cohesion: 0.21
Nodes (5): BeigeButton, .body, BeigeButtonStyle, .body, .body

### Community 37 - "RoundCheckBox"
Cohesion: 0.23
Nodes (6): RoundCheckBox, .body, .currentBgColor, .currentBinding, .currentBorderColor, .isChecked

### Community 38 - "DeleteListingBottomSheet"
Cohesion: 0.26
Nodes (5): DeleteListingBottomSheet, .body, .currentBinding, DeleteListingBottomSheetContent, .body

### Community 39 - "SharedPaymentBottomSheet"
Cohesion: 0.29
Nodes (5): SharedPaymentBottomSheet, .body, .currentBinding, SharedPaymentBottomSheetContent, .body

### Community 40 - "Color"
Cohesion: 0.19
Nodes (5): SendInviteBottomBar, LeaveRequestBottomBar, PublishButton, Color, .roomie

### Community 41 - "MonthlyPaymentItem"
Cohesion: 0.27
Nodes (6): ListingMonthlyPaymentCard, .body, ListingMonthlySectionItem, .body, MonthlyPaymentItem, .id

### Community 42 - "PublishCurrentAddress"
Cohesion: 0.20
Nodes (7): PublishCurrentAddress, .body, .currentAddress1, .currentAddress2, .currentCity, .currentState, .currentZipCode

### Community 44 - "UpdateRentBottomSheet"
Cohesion: 0.29
Nodes (5): UpdateRentBottomSheet, .body, .currentBinding, UpdateRentBottomSheetContent, .body

### Community 45 - "SettingOptionItem"
Cohesion: 0.38
Nodes (5): SettingOptionItem, .body, SettingOptionItemContent, .body, .body

### Community 46 - "HomeNavigationBar"
Cohesion: 0.29
Nodes (3): HomeNavigationBar, .body, .selectedIndex

### Community 47 - "AddTaskItem"
Cohesion: 0.24
Nodes (4): AddTaskItem, .body, TaskItem, .body

### Community 48 - "PlannerDestination"
Cohesion: 0.16
Nodes (12): PaymentsDestination, .id, incidents, .label, services, PaymentsScreen, PlannerDestination, events (+4 more)

### Community 49 - "SwitchItem"
Cohesion: 0.33
Nodes (3): SwitchItem, .body, .currentBinding

### Community 50 - "HomeGreenHeaderCard"
Cohesion: 0.24
Nodes (4): HomeGreenHeaderCard, .body, HomeTab, .body

### Community 51 - "AddEventItem"
Cohesion: 0.25
Nodes (4): AddEventItem, .body, PlannerEventTab, .body

### Community 52 - "HomeTabsTenantLeaseholder"
Cohesion: 0.14
Nodes (13): HomeTabsTenantLeaseholder, home, .id, .item, payments, planner, profile, roomies (+5 more)

### Community 53 - "LocationInfoMessage"
Cohesion: 0.25
Nodes (5): ListingLocationSection, .body, LocationInfoMessage, .body, .highlightedText

### Community 55 - "HomeScreen"
Cohesion: 0.43
Nodes (3): HomeScreen, .body, HomeViewModel

### Community 56 - ".body"
Cohesion: 0.24
Nodes (6): ListingPhotoSection, .body, ContactButton, .body, ListingDetailScreen, .body

### Community 58 - "DefaultButton"
Cohesion: 0.27
Nodes (3): DefaultButton, .body, DefaultButtonStyle

### Community 59 - "HomeTabHeader"
Cohesion: 0.25
Nodes (4): HomeTabHeader, .body, PlannerTasks, .body

### Community 60 - "ProfileIsTenantInAddress"
Cohesion: 0.36
Nodes (3): ProfileIsTenantInAddress, .body, .currentBinding

### Community 62 - "BaseGreenCard"
Cohesion: 0.25
Nodes (4): BaseGreenCard, .body, ListingGreenCard, .body

### Community 67 - "BaseCard"
Cohesion: 0.33
Nodes (4): BaseCard, .body, .body, .body

### Community 68 - "PasswordRecoveryConfirmationScreen"
Cohesion: 0.18
Nodes (6): View, LoginScreen, PasswordRecoveryConfirmationScreen, .message, PasswordRecoveryScreen, .body

### Community 69 - "OnboardingRoute"
Cohesion: 0.22
Nodes (7): Place, OnboardingRoute, .id, Login, PasswordRecovery, PasswordRecoveryConfirmation, SignIn

### Community 72 - "RoomieTheme.swift"
Cohesion: 0.43
Nodes (3): RoomieCardModifier, RoomieGlassCardModifier, View

### Community 73 - ".body"
Cohesion: 0.28
Nodes (3): .tabItems, HomeTabs, .body

### Community 74 - "RoomieColorTokens"
Cohesion: 0.38
Nodes (4): RoomieColorTokens, RoomieTheme, .colors, UIKit

### Community 78 - "PaymentIncidentItem"
Cohesion: 0.15
Nodes (7): PaymentIncidentItem, .body, PaymentsIncidents, .body, PaymentsServicesTab, .body, .body

## Knowledge Gaps
- **159 isolated node(s):** `.body`, `.body`, `Home`, `ListingDetails`, `Messages` (+154 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 299 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **67 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `String` connect `String` to `String`, `InputWithLabel`, `ExplorerView`, `RoomieTask`, `StarRatingBar`, `Font Assets & Definitions`, `ListingCardItem`, `Input`, `ListingReviewCard`, `SettingsRoute`, `BaseSimpleButton`, `ChatTenantConversationCard`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `HomeTabItem`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `BottomSheetRoute`, `GreenCTAButton`, `Foundation`, `RoomieSectionHeader`, `BeigeButton`, `DeleteListingBottomSheet`, `SharedPaymentBottomSheet`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `ScreenConfig`, `UpdateRentBottomSheet`, `SettingOptionItem`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `HomeGreenHeaderCard`, `AddEventItem`, `HomeTabsTenantLeaseholder`, `LocationInfoMessage`, `.body`, `.body`, `DefaultButton`, `ProfileIsTenantInAddress`, `HomeScaffold`, `BaseGreenCard`, `PublishAmenities`, `PublishNearbyPlaces`, `EventItem`, `PasswordRecoveryConfirmationScreen`, `OnboardingRoute`, `HideListingItem`, `PaymentIncidentItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `InlineNavigationTitleModifier`, `PublishPhotoItems`, `PublishSharedServices`, `PaymentRoomieItem`, `ProfileReviewsSection`, `RoomieSectionHeader`?**
  _High betweenness centrality (0.470) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `NavigationRouter` (e.g. with `ContentView` and `AppNavHost`) actually correct?**
  _`NavigationRouter` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `.body`, `.body`, `Home` to the rest of the system?**
  _159 weakly-connected nodes found - possible missing edges._
- **Should `RoomieTask` be split into smaller, more focused modules?**
  _Cohesion score 0.06951219512195123 - nodes in this community are weakly interconnected._
- **Why does `SwiftUI` connect `SwiftUI` to `String`, `InputWithLabel`, `ExplorerView`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `Font Assets & Definitions`, `ListingCardItem`, `View`, `Typography & Font Tokens`, `Input`, `BaseBottomSheet`, `ListingReviewCard`, `SettingsRoute`, `BaseSimpleButton`, `ChatTenantConversationCard`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `GreenCTAButton`, `String`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `DeleteListingBottomSheet`, `SharedPaymentBottomSheet`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `ScreenConfig`, `UpdateRentBottomSheet`, `SettingOptionItem`, `HomeNavigationBar`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `HomeGreenHeaderCard`, `AddEventItem`, `LocationInfoMessage`, `.body`, `.body`, `View`, `DefaultButton`, `HomeTabHeader`, `ProfileIsTenantInAddress`, `HomeScaffold`, `BaseGreenCard`, `.body`, `PublishAmenities`, `PublishNearbyPlaces`, `EventItem`, `BaseCard`, `PasswordRecoveryConfirmationScreen`, `NotificationsScreen`, `PrivacyScreen`, `RoomieTheme.swift`, `.body`, `RoomieColorTokens`, `ExploreMap`, `HideListingItem`, `PaymentIncidentItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `CardBackground`, `InlineNavigationTitleModifier`, `Foundation`, `ViewModifier`, `.body`, `PublishPhotoItems`, `PublishSharedServices`, `PaymentRoomieItem`, `ProfileReviewsSection`, `RoomieSectionHeader`?**
  _High betweenness centrality (0.140) - this node is a cross-community bridge._
- **Should `StarRatingBar` be split into smaller, more focused modules?**
  _Cohesion score 0.07956989247311828 - nodes in this community are weakly interconnected._
- **Why does `NavigationRouter` connect `NavigationRouter` to `String`, `InputWithLabel`, `ExplorerView`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `ListingCardItem`, `View`, `Input`, `BaseBottomSheet`, `ListingReviewCard`, `SettingsRoute`, `BaseSimpleButton`, `ChatTenantConversationCard`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `BottomSheetRoute`, `GreenCTAButton`, `SwiftUI`, `String`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `DeleteListingBottomSheet`, `SharedPaymentBottomSheet`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `UpdateRentBottomSheet`, `SettingOptionItem`, `HomeNavigationBar`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `HomeGreenHeaderCard`, `AddEventItem`, `LocationInfoMessage`, `.body`, `HomeScreen`, `.body`, `HomeTabHeader`, `ProfileIsTenantInAddress`, `HomeScaffold`, `BaseGreenCard`, `.body`, `PublishAmenities`, `PublishNearbyPlaces`, `EventItem`, `PasswordRecoveryConfirmationScreen`, `NotificationsScreen`, `PrivacyScreen`, `ExploreMap`, `HideListingItem`, `PaymentIncidentItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `.body`, `PublishPhotoItems`, `PublishSharedServices`, `PaymentRoomieItem`, `ProfileReviewsSection`, `RoomieSectionHeader`?**
  _High betweenness centrality (0.130) - this node is a cross-community bridge._