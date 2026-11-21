# Graph Report - TrustedRoomie  (2026-11-20)

## Corpus Check
- 189 files · ~43,159 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 21 file(s) not represented in the graph (top: .ttf 13, (none) 2, .plist 2)

## Summary
- 1215 nodes · 2536 edges · 130 communities (64 shown, 66 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 294 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `55635fc6`
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
- BasicText
- Typography & Font Tokens
- Input
- BaseBottomSheet
- ListingReviewCard
- SettingsRoute
- LogoutBottomSheet
- NotifyLeaveBottomSheet
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
- Observation
- String
- RoomieSectionHeader
- BeigeButton
- RoundCheckBox
- String
- BaseSimpleButton
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
- RoomieSectionHeader
- BaseCard
- HomeTabsTenantLeaseholder
- LocationInfoMessage
- .body
- HomeScreen
- .body
- View
- HomeRoute
- ProfileEmptyState
- ProfileIsTenantInAddress
- HomeScaffold
- BaseGreenCard
- ProfileSessionStartedState
- ScreenTopBar
- HomeGreenHeaderCard
- EventItem
- LeaveRequestBottomBar
- SwiftUI
- OnboardingRoute
- NotificationsScreen
- PrivacyScreen
- RoomieTheme.swift
- UserType
- PaymentIncidentItem
- NavigationRouter
- ExploreMap
- HideListingItem
- PaymentIncidentItem
- RoomieListItem
- ChangePasswordScreen
- PersonalInfoScreen
- CardBackground
- InlineNavigationTitleModifier
- Identifiable
- PasswordRecoveryConfirmationScreen
- ViewModifier
- PasswordRecoveryScreen
- .body
- PublishAddPaymentSection
- RateRoomie

## God Nodes (most connected - your core abstractions)
1. `NavigationRouter` - 155 edges
2. `BaseCard` - 31 edges
3. `HomeRoute` - 20 edges
4. `InputWithLabel` - 20 edges
5. `GreenCTAButton` - 20 edges
6. `RoomieTextStyle` - 18 edges
7. `Input` - 18 edges
8. `BaseBottomSheet` - 18 edges
9. `ListingCardItem` - 18 edges
10. `HomeTabItem` - 17 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `YellowChip`  [INFERRED]
  TrustedRoomie/UI/Components/Roomies/LeavingRequestNotification.swift → TrustedRoomie/UI/Components/Common/Chip.swift
- `.body` --calls--> `BasicText`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/Details/ListingLocationSection.swift → TrustedRoomie/Extensions/StringExt.swift
- `.body` --calls--> `SwitchItem`  [INFERRED]
  TrustedRoomie/UI/Components/Profile/ProfileIsTenantInAddress.swift → TrustedRoomie/UI/Components/Common/SwitchItem.swift
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/Publish/PublishListingInfo.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Screen/Settings/ChangePasswordScreen.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift

## Import Cycles
- None detected.

## Communities (130 total, 66 thin omitted)

### Community 0 - "String"
Cohesion: 0.29
Nodes (6): ApartmentHistoryItem, .id, ApartmentItem, .body, ProfileHistory, .body

### Community 2 - "ExplorerView"
Cohesion: 0.10
Nodes (20): ExplorerHeader, .body, PreviewWrapper, .body, ExplorerView, .id, list, map (+12 more)

### Community 3 - "AppNavHost"
Cohesion: 0.17
Nodes (6): MyApp, .body, AppNavHost, .body, NavigationScreen, .body

### Community 4 - "RoomieTask"
Cohesion: 0.06
Nodes (19): ContentView, .body, CodingKeys, completed, id, title, RoomieTask, NetworkError (+11 more)

### Community 5 - "StarRatingBar"
Cohesion: 0.13
Nodes (7): StarRatingBar, .body, .displayText, ListingInfoSection, .body, RateItem, .body

### Community 6 - "ButtonStyle"
Cohesion: 0.21
Nodes (3): .body, RoomiePineButtonStyle, RoomiePrimaryButtonStyle

### Community 7 - "Font Assets & Definitions"
Cohesion: 0.10
Nodes (21): AppFont, DMSans, extraBold, extraLight, light, medium, .name, regular (+13 more)

### Community 8 - "ListingCardItem"
Cohesion: 0.08
Nodes (15): BaseScaffold, .body, ExploreList, .body, ExploreListingCard, ListingCardItem, MapView, .body (+7 more)

### Community 9 - "BasicText"
Cohesion: 0.14
Nodes (6): BasicText, .body, RoomInfoPill, .body, .highlightedText, .body

### Community 10 - "Typography & Font Tokens"
Cohesion: 0.11
Nodes (18): Font, RoomieFontTokens, RoomieTextStyle, bodyLarge, bodyMedium, displayLarge, displayMedium, .font (+10 more)

### Community 14 - "Input"
Cohesion: 0.13
Nodes (12): Input, .body, .currentTextBinding, InputWithIcon, .body, .currentTextBinding, .body, PublishAddMultipleText (+4 more)

### Community 15 - "BaseBottomSheet"
Cohesion: 0.06
Nodes (20): BaseBottomSheet, .body, View, DeleteListingBottomSheet, .body, .currentBinding, DeleteListingBottomSheetContent, .body (+12 more)

### Community 16 - "ListingReviewCard"
Cohesion: 0.24
Nodes (4): ListingReviewCard, .highlightedText, ProfileReviewsSection, .body

### Community 17 - "SettingsRoute"
Cohesion: 0.18
Nodes (9): SettingsRoute, ChangePasswordScreen, .id, NotificationsScreen, PersonalInfoScreen, PrivacyScreen, Settings, View (+1 more)

### Community 18 - "LogoutBottomSheet"
Cohesion: 0.26
Nodes (6): LogoutBottomSheet, .body, .currentBinding, LogoutBottomSheetContent, .body, .descriptionText

### Community 19 - "NotifyLeaveBottomSheet"
Cohesion: 0.29
Nodes (5): NotifyLeaveBottomSheet, .body, .currentBinding, NotifyLeaveBottomSheetContent, .body

### Community 20 - "ToggleChip"
Cohesion: 0.10
Nodes (11): ToggleChip, .backgroundColor, .body, .currentBinding, .selectedValue, .textColor, FlowLayout, LeaveRequest (+3 more)

### Community 21 - "PaymentPaymentsItem"
Cohesion: 0.20
Nodes (5): PaymentPaymentsItem, .body, .titleFont, RoomiePaymentEntry, PaymentRoomieItem

### Community 22 - "ListingClosePlacesCard"
Cohesion: 0.33
Nodes (4): ListingClosePlacesCard, .body, ListingPlaceItem, .body

### Community 23 - "PublishAddSection"
Cohesion: 0.09
Nodes (9): PublishAddSection, .body, .currentItems, PublishAmenities, .body, PublishNearbyPlaces, .body, PublishRules (+1 more)

### Community 24 - "HomeTabItem"
Cohesion: 0.16
Nodes (15): HomeTabItem, HomeTabsRegistered, chats, explore, .id, .item, notifications, profile (+7 more)

### Community 25 - "BaseListingCardSection"
Cohesion: 0.14
Nodes (8): BaseListingCardSection, .body, ListingAmenitiesCard, .body, ListingRuleItem, .body, ListingRulesCard, .body

### Community 26 - "Chip"
Cohesion: 0.15
Nodes (12): Chip, .body, GlassChip, .body, GreenChip, .body, YellowChip, .body (+4 more)

### Community 27 - "NotificationItemCard"
Cohesion: 0.21
Nodes (6): NotificationItemCard, .body, NotificationsTab, .body, NotificationsTabContent, .body

### Community 28 - "ChatBalloonLeft"
Cohesion: 0.11
Nodes (11): ChatBalloonLeft, .balloonShape, .body, ChatBalloonRight, .balloonShape, .body, ChatMessageBox, .body (+3 more)

### Community 29 - "BottomCTAButton"
Cohesion: 0.24
Nodes (5): BottomCTAButton, .subtitleTextColor, .body, .body, .body

### Community 30 - "BottomSheetRoute"
Cohesion: 0.14
Nodes (9): BottomSheetRoute, custom, deleteListing, .id, logout, notifyLeave, notifyPayment, sharedPayment (+1 more)

### Community 31 - "GreenCTAButton"
Cohesion: 0.24
Nodes (6): GreenCTAButton, .body, GreenCTAButtonStyle, RedCTAButton, .body, .body

### Community 32 - "Foundation"
Cohesion: 0.12
Nodes (9): BaseViewModel, UiEvent, navigate, showSnackbar, UiState, error, idle, loading (+1 more)

### Community 33 - "Observation"
Cohesion: 0.28
Nodes (4): Observation, ExploreTab, .body, ExploreTabViewModel

### Community 34 - "String"
Cohesion: 0.17
Nodes (6): ProfileContactSection, .body, ProfileCurrentAddress, ProfilePublishPlaceItem, .body, .body

### Community 35 - "RoomieSectionHeader"
Cohesion: 0.25
Nodes (4): LeavingRequestNotification, .body, RoomiesTab, .body

### Community 36 - "BeigeButton"
Cohesion: 0.24
Nodes (6): BeigeButton, .body, BeigeButtonStyle, .body, .body, .body

### Community 37 - "RoundCheckBox"
Cohesion: 0.15
Nodes (8): RoundCheckBox, .body, .currentBgColor, .currentBinding, .currentBorderColor, .isChecked, TaskItem, .body

### Community 38 - "String"
Cohesion: 0.31
Nodes (5): EmptyExampleView, String, ListingPlaceReviews, .body, ListingTenantReview

### Community 39 - "BaseSimpleButton"
Cohesion: 0.27
Nodes (3): BaseSimpleButton, .body, BaseSimpleButtonStyle

### Community 40 - "Color"
Cohesion: 0.23
Nodes (5): ChatTenantConversationCard, .body, SendInviteBottomBar, Color, .roomie

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
Cohesion: 0.33
Nodes (5): SettingOptionItem, .body, SettingOptionItemContent, .body, .body

### Community 46 - "HomeNavigationBar"
Cohesion: 0.29
Nodes (3): HomeNavigationBar, .body, .selectedIndex

### Community 47 - "AddTaskItem"
Cohesion: 0.22
Nodes (5): AddTaskItem, .body, PlannerTasks, .body, .body

### Community 48 - "PlannerDestination"
Cohesion: 0.16
Nodes (12): PaymentsDestination, .id, incidents, .label, services, PaymentsScreen, PlannerDestination, events (+4 more)

### Community 49 - "SwitchItem"
Cohesion: 0.33
Nodes (3): SwitchItem, .body, .currentBinding

### Community 50 - "RoomieSectionHeader"
Cohesion: 0.24
Nodes (4): RoomieSectionHeader, .body, HomeTab, .body

### Community 51 - "BaseCard"
Cohesion: 0.22
Nodes (5): BaseCard, .body, .body, AddEventItem, .body

### Community 52 - "HomeTabsTenantLeaseholder"
Cohesion: 0.25
Nodes (8): HomeTabsTenantLeaseholder, home, .id, .item, payments, planner, profile, roomies

### Community 53 - "LocationInfoMessage"
Cohesion: 0.25
Nodes (5): ListingLocationSection, .body, LocationInfoMessage, .body, .highlightedText

### Community 56 - ".body"
Cohesion: 0.25
Nodes (4): ListingGreenCard, ListingPhotoSection, .body, .body

### Community 58 - "HomeRoute"
Cohesion: 0.06
Nodes (23): DefaultButton, .body, DefaultButtonStyle, .body, HomeRoute, Home, .id, LeaveRequest (+15 more)

### Community 59 - "ProfileEmptyState"
Cohesion: 0.24
Nodes (4): ProfileEmptyState, .body, ProfileTab, .body

### Community 60 - "ProfileIsTenantInAddress"
Cohesion: 0.36
Nodes (3): ProfileIsTenantInAddress, .body, .currentBinding

### Community 62 - "BaseGreenCard"
Cohesion: 0.40
Nodes (3): BaseGreenCard, .body, .body

### Community 63 - "ProfileSessionStartedState"
Cohesion: 0.33
Nodes (4): .body, ProfileHeader, .body, ProfileSessionStartedState

### Community 66 - "EventItem"
Cohesion: 0.24
Nodes (4): EventItem, .body, PlannerEventTab, .body

### Community 68 - "SwiftUI"
Cohesion: 0.21
Nodes (5): MapKit, SwiftUI, View, LoginScreen, SignInScreen

### Community 69 - "OnboardingRoute"
Cohesion: 0.29
Nodes (6): OnboardingRoute, .id, Login, PasswordRecovery, PasswordRecoveryConfirmation, SignIn

### Community 72 - "RoomieTheme.swift"
Cohesion: 0.43
Nodes (3): RoomieCardModifier, RoomieGlassCardModifier, View

### Community 73 - "UserType"
Cohesion: 0.18
Nodes (7): UserType, leaseholder, registered, tenant, unregistered, .body, HomeTabs

### Community 75 - "NavigationRouter"
Cohesion: 0.25
Nodes (3): NavigationRouter, .isBottomSheetPresented, ProfileScreen

### Community 78 - "PaymentIncidentItem"
Cohesion: 0.15
Nodes (6): HomeTabHeader, PaymentsIncidents, .body, PaymentsServicesTab, .body, .body

### Community 121 - ".body"
Cohesion: 0.24
Nodes (4): PublishButton, PublishPhotoItems, .body, .body

### Community 122 - "PublishAddPaymentSection"
Cohesion: 0.12
Nodes (7): PublishAdd, .body, PublishAddPaymentSection, .body, .currentItems, PublishSharedServices, .body

## Knowledge Gaps
- **159 isolated node(s):** `.body`, `.body`, `.highlightedText`, `.id`, `.body` (+154 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 299 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **66 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `String` connect `String` to `String`, `InputWithLabel`, `ExplorerView`, `RoomieTask`, `StarRatingBar`, `Font Assets & Definitions`, `ListingCardItem`, `BasicText`, `Input`, `BaseBottomSheet`, `ListingReviewCard`, `SettingsRoute`, `LogoutBottomSheet`, `NotifyLeaveBottomSheet`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `HomeTabItem`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `BottomSheetRoute`, `GreenCTAButton`, `Foundation`, `String`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `BaseSimpleButton`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `ScreenConfig`, `UpdateRentBottomSheet`, `SettingOptionItem`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `RoomieSectionHeader`, `BaseCard`, `LocationInfoMessage`, `.body`, `.body`, `HomeRoute`, `ProfileEmptyState`, `ProfileIsTenantInAddress`, `HomeScaffold`, `ProfileSessionStartedState`, `ScreenTopBar`, `HomeGreenHeaderCard`, `EventItem`, `LeaveRequestBottomBar`, `SwiftUI`, `OnboardingRoute`, `UserType`, `PaymentIncidentItem`, `HideListingItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `InlineNavigationTitleModifier`, `Identifiable`, `PasswordRecoveryConfirmationScreen`, `PasswordRecoveryScreen`, `.body`, `PublishAddPaymentSection`, `RateRoomie`?**
  _High betweenness centrality (0.397) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `NavigationRouter` (e.g. with `ContentView` and `AppNavHost`) actually correct?**
  _`NavigationRouter` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `.body`, `.body`, `.highlightedText` to the rest of the system?**
  _159 weakly-connected nodes found - possible missing edges._
- **Should `ExplorerView` be split into smaller, more focused modules?**
  _Cohesion score 0.09659090909090909 - nodes in this community are weakly interconnected._
- **Why does `NavigationRouter` connect `NavigationRouter` to `String`, `InputWithLabel`, `ExplorerView`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `ListingCardItem`, `BasicText`, `Input`, `BaseBottomSheet`, `ListingReviewCard`, `SettingsRoute`, `LogoutBottomSheet`, `NotifyLeaveBottomSheet`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `BottomSheetRoute`, `GreenCTAButton`, `Observation`, `String`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `String`, `BaseSimpleButton`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `UpdateRentBottomSheet`, `SettingOptionItem`, `HomeNavigationBar`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `RoomieSectionHeader`, `BaseCard`, `LocationInfoMessage`, `.body`, `HomeScreen`, `.body`, `HomeRoute`, `ProfileEmptyState`, `ProfileIsTenantInAddress`, `HomeScaffold`, `BaseGreenCard`, `ProfileSessionStartedState`, `ScreenTopBar`, `HomeGreenHeaderCard`, `EventItem`, `LeaveRequestBottomBar`, `SwiftUI`, `NotificationsScreen`, `PrivacyScreen`, `PaymentIncidentItem`, `ExploreMap`, `HideListingItem`, `PaymentIncidentItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `PasswordRecoveryConfirmationScreen`, `PasswordRecoveryScreen`, `.body`, `PublishAddPaymentSection`, `RateRoomie`?**
  _High betweenness centrality (0.148) - this node is a cross-community bridge._
- **Should `RoomieTask` be split into smaller, more focused modules?**
  _Cohesion score 0.06342494714587738 - nodes in this community are weakly interconnected._
- **Why does `SwiftUI` connect `SwiftUI` to `String`, `InputWithLabel`, `ExplorerView`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `Font Assets & Definitions`, `ListingCardItem`, `BasicText`, `Typography & Font Tokens`, `Input`, `BaseBottomSheet`, `ListingReviewCard`, `SettingsRoute`, `LogoutBottomSheet`, `NotifyLeaveBottomSheet`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `GreenCTAButton`, `Observation`, `String`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `String`, `BaseSimpleButton`, `Color`, `MonthlyPaymentItem`, `PublishCurrentAddress`, `ScreenConfig`, `UpdateRentBottomSheet`, `SettingOptionItem`, `HomeNavigationBar`, `AddTaskItem`, `PlannerDestination`, `SwitchItem`, `RoomieSectionHeader`, `BaseCard`, `.body`, `HomeScreen`, `.body`, `View`, `HomeRoute`, `ProfileEmptyState`, `ProfileIsTenantInAddress`, `HomeScaffold`, `BaseGreenCard`, `ProfileSessionStartedState`, `ScreenTopBar`, `HomeGreenHeaderCard`, `EventItem`, `LeaveRequestBottomBar`, `NotificationsScreen`, `PrivacyScreen`, `RoomieTheme.swift`, `UserType`, `PaymentIncidentItem`, `NavigationRouter`, `ExploreMap`, `HideListingItem`, `PaymentIncidentItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `CardBackground`, `InlineNavigationTitleModifier`, `PasswordRecoveryConfirmationScreen`, `ViewModifier`, `PasswordRecoveryScreen`, `.body`, `PublishAddPaymentSection`, `RateRoomie`?**
  _High betweenness centrality (0.132) - this node is a cross-community bridge._