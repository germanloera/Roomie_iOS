# Graph Report - TrustedRoomie  (2026-11-26)

## Corpus Check
- 194 files · ~46,507 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 21 file(s) not represented in the graph (top: .ttf 13, (none) 2, .plist 2)

## Summary
- 1291 nodes · 2711 edges · 136 communities (67 shown, 69 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 301 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `cd37253d`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- String
- InputWithLabel
- ExplorerView
- AppNavHost
- RoomieTask
- StarRatingBar
- DefaultButton
- Font Assets & Definitions
- ListingCardItem
- BasicText
- Typography & Font Tokens
- Input
- BottomSheetRoute
- InputFormat
- SettingsRoute
- BaseSimpleButton
- BaseBottomSheet
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
- ChatTenantConversationCard
- GreenCTAButton
- DropdownInput
- Observation
- .navigate
- RoomieSectionHeader
- BeigeButton
- RoundCheckBox
- String
- Sendable
- Color
- MonthlyPaymentItem
- NotifyPaymentBottomSheet
- ScreenConfig
- SharedPaymentBottomSheet
- SettingOptionItem
- HomeNavigationBar
- BaseCard
- PlannerDestination
- SwitchItem
- .body
- AddEventItem
- HomeTabsTenantLeaseholder
- LocationInfoMessage
- TaskItem
- HomeScreen
- .body
- MapListingCard
- HomeRoute
- ProfileEmptyState
- RoomieColorTokens
- HomeScaffold
- BaseGreenCard
- ProfileIsTenantInAddress
- ScreenTopBar
- View
- EventItem
- HomeTabsRegistered
- PasswordRecoveryScreen
- OnboardingRoute
- NotificationsScreen
- PrivacyScreen
- BaseScaffold
- UserType
- PaymentIncidentItem
- PaymentRoomieItem
- ExploreMap
- HideListingItem
- NavigationRouter
- RoomieListItem
- ChangePasswordScreen
- PersonalInfoScreen
- HomeTabHeader
- ListingInfoSection
- Identifiable
- PasswordRecoveryConfirmationScreen
- PublishButton
- ManageListingScreen
- PublishPhotoItems
- PublishAddPaymentSection
- RateRoomie
- SignInScreen
- SettingsScreen
- SwiftUI
- ListingPhotoSection
- ListingCreateEditScreen

## God Nodes (most connected - your core abstractions)
1. `NavigationRouter` - 155 edges
2. `BaseCard` - 31 edges
3. `Input` - 26 edges
4. `InputFormat` - 23 edges
5. `InputRestriction` - 22 edges
6. `InputWithLabel` - 22 edges
7. `GreenCTAButton` - 20 edges
8. `HomeRoute` - 20 edges
9. `RoomieTextStyle` - 18 edges
10. `BaseBottomSheet` - 18 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `Input`  [INFERRED]
  TrustedRoomie/UI/Components/Common/InputWithLabel.swift → TrustedRoomie/UI/Components/Common/Input.swift
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Screen/Settings/ChangePasswordScreen.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift
- `.body` --calls--> `ListingReviewCard`  [INFERRED]
  TrustedRoomie/UI/Components/Profile/ProfileSectionReview.swift → TrustedRoomie/UI/Components/Listing/Details/ListingPlaceReviews.swift
- `.body` --calls--> `PaymentPaymentsItem`  [INFERRED]
  TrustedRoomie/UI/Components/Payments/PaymentsServicesTab.swift → TrustedRoomie/UI/Components/Payments/Items/PaymentPaymentsItem.swift
- `.body` --calls--> `Chip`  [INFERRED]
  TrustedRoomie/UI/Components/Payments/Items/PaymentRoomieItem.swift → TrustedRoomie/UI/Components/Common/Chip.swift

## Import Cycles
- None detected.

## Communities (136 total, 69 thin omitted)

### Community 0 - "String"
Cohesion: 0.29
Nodes (6): ApartmentHistoryItem, .id, ApartmentItem, .body, ProfileHistory, .body

### Community 1 - "InputWithLabel"
Cohesion: 0.18
Nodes (4): InputWithLabel, .body, PublishListingInfo, .body

### Community 2 - "ExplorerView"
Cohesion: 0.19
Nodes (11): .body, ExplorerView, .id, list, map, HomeToggleButton, .body, PreviewContainer (+3 more)

### Community 3 - "AppNavHost"
Cohesion: 0.17
Nodes (6): MyApp, .body, AppNavHost, .body, NavigationScreen, .body

### Community 4 - "RoomieTask"
Cohesion: 0.06
Nodes (20): Foundation, ContentView, .body, CodingKeys, completed, id, title, RoomieTask (+12 more)

### Community 5 - "StarRatingBar"
Cohesion: 0.17
Nodes (5): StarRatingBar, .body, .displayText, RateItem, .body

### Community 6 - "DefaultButton"
Cohesion: 0.08
Nodes (12): EmptyExampleView, .body, DefaultButton, .body, DefaultButtonStyle, ProfileCurrentAddress, .body, RoomieCardModifier (+4 more)

### Community 7 - "Font Assets & Definitions"
Cohesion: 0.10
Nodes (21): AppFont, DMSans, extraBold, extraLight, light, medium, .name, regular (+13 more)

### Community 8 - "ListingCardItem"
Cohesion: 0.30
Nodes (4): ExploreListingCard, ListingCardItem, SendInvite, .body

### Community 9 - "BasicText"
Cohesion: 0.08
Nodes (12): BasicText, .body, RoomInfoPill, .body, .highlightedText, ListingPlaceReviews, .body, ListingReviewCard (+4 more)

### Community 10 - "Typography & Font Tokens"
Cohesion: 0.11
Nodes (18): Font, RoomieFontTokens, RoomieTextStyle, bodyLarge, bodyMedium, displayLarge, displayMedium, .font (+10 more)

### Community 14 - "Input"
Cohesion: 0.29
Nodes (6): Input, .currentRawText, .shouldShowError, InputWithIcon, .body, .currentTextBinding

### Community 15 - "BottomSheetRoute"
Cohesion: 0.06
Nodes (21): DeleteListingBottomSheet, .body, .currentBinding, DeleteListingBottomSheetContent, .body, UpdateRentBottomSheet, .body, .currentBinding (+13 more)

### Community 16 - "InputFormat"
Cohesion: 0.12
Nodes (10): InputFormat, currency, customMask, .keyboardType, none, number, phone, .body (+2 more)

### Community 17 - "SettingsRoute"
Cohesion: 0.29
Nodes (8): SettingsRoute, ChangePasswordScreen, .id, NotificationsScreen, PersonalInfoScreen, PrivacyScreen, Settings, View

### Community 18 - "BaseSimpleButton"
Cohesion: 0.09
Nodes (14): LogoutBottomSheet, .body, .currentBinding, LogoutBottomSheetContent, .body, .descriptionText, NotifyLeaveBottomSheet, .body (+6 more)

### Community 19 - "BaseBottomSheet"
Cohesion: 0.26
Nodes (3): BaseBottomSheet, .body, View

### Community 20 - "ToggleChip"
Cohesion: 0.10
Nodes (11): ToggleChip, .backgroundColor, .body, .currentBinding, .selectedValue, .textColor, FlowLayout, LeaveRequest (+3 more)

### Community 21 - "PaymentPaymentsItem"
Cohesion: 0.31
Nodes (4): PaymentPaymentsItem, .body, .titleFont, RoomiePaymentEntry

### Community 22 - "ListingClosePlacesCard"
Cohesion: 0.33
Nodes (4): ListingClosePlacesCard, .body, ListingPlaceItem, .body

### Community 23 - "PublishAddSection"
Cohesion: 0.05
Nodes (18): PublishAddSection, .body, .currentItems, PublishAmenities, .body, PublishCurrentAddress, .body, .currentAddress1 (+10 more)

### Community 24 - "HomeTabItem"
Cohesion: 0.26
Nodes (8): HomeTabItem, HomeTabsUnregistered, explore, .id, .item, profile, .tabItems, .body

### Community 25 - "BaseListingCardSection"
Cohesion: 0.14
Nodes (8): BaseListingCardSection, .body, ListingAmenitiesCard, .body, ListingRuleItem, .body, ListingRulesCard, .body

### Community 26 - "Chip"
Cohesion: 0.18
Nodes (12): Chip, .body, GlassChip, .body, GreenChip, .body, YellowChip, .body (+4 more)

### Community 27 - "NotificationItemCard"
Cohesion: 0.21
Nodes (6): NotificationItemCard, .body, NotificationsTab, .body, NotificationsTabContent, .body

### Community 28 - "ChatBalloonLeft"
Cohesion: 0.11
Nodes (11): ChatBalloonLeft, .balloonShape, .body, ChatBalloonRight, .balloonShape, .body, ChatMessageBox, .body (+3 more)

### Community 29 - "BottomCTAButton"
Cohesion: 0.17
Nodes (6): BottomCTAButton, .subtitleTextColor, .body, LeaveRequestBottomBar, .body, .body

### Community 30 - "ChatTenantConversationCard"
Cohesion: 0.21
Nodes (6): ChatTenantConversationCard, .body, ChatTab, .body, ChatTabContent, .body

### Community 31 - "GreenCTAButton"
Cohesion: 0.24
Nodes (6): GreenCTAButton, .body, GreenCTAButtonStyle, RedCTAButton, .body, .body

### Community 32 - "DropdownInput"
Cohesion: 0.06
Nodes (22): DropdownOption, BaseViewModel, UiEvent, navigate, showSnackbar, UiState, error, idle (+14 more)

### Community 33 - "Observation"
Cohesion: 0.28
Nodes (4): Observation, ExploreTab, .body, ExploreTabViewModel

### Community 34 - ".navigate"
Cohesion: 0.33
Nodes (3): ProfilePublishPlaceItem, .body, .body

### Community 35 - "RoomieSectionHeader"
Cohesion: 0.18
Nodes (5): LeavingRequestNotification, RoomieSectionHeader, .body, RoomiesTab, .body

### Community 36 - "BeigeButton"
Cohesion: 0.19
Nodes (6): BeigeButton, .body, BeigeButtonStyle, .body, .body, .body

### Community 37 - "RoundCheckBox"
Cohesion: 0.23
Nodes (6): RoundCheckBox, .body, .currentBgColor, .currentBinding, .currentBorderColor, .isChecked

### Community 39 - "Sendable"
Cohesion: 0.20
Nodes (9): RoomType, shared, single, suite, Zone, condesa, delValle, polanco (+1 more)

### Community 40 - "Color"
Cohesion: 0.24
Nodes (5): SendInviteBottomBar, UserCard, .body, Color, .roomie

### Community 41 - "MonthlyPaymentItem"
Cohesion: 0.27
Nodes (6): ListingMonthlyPaymentCard, .body, ListingMonthlySectionItem, .body, MonthlyPaymentItem, .id

### Community 42 - "NotifyPaymentBottomSheet"
Cohesion: 0.29
Nodes (5): NotifyPaymentBottomSheet, .body, .currentBinding, NotifyPaymentBottomSheetContent, .body

### Community 43 - "ScreenConfig"
Cohesion: 0.07
Nodes (6): AppBackground, CardBackground, InlineNavigationTitleModifier, ScreenConfig, TitleModifier, View

### Community 44 - "SharedPaymentBottomSheet"
Cohesion: 0.29
Nodes (5): SharedPaymentBottomSheet, .body, .currentBinding, SharedPaymentBottomSheetContent, .body

### Community 45 - "SettingOptionItem"
Cohesion: 0.42
Nodes (4): SettingOptionItem, .body, SettingOptionItemContent, .body

### Community 46 - "HomeNavigationBar"
Cohesion: 0.29
Nodes (3): HomeNavigationBar, .body, .selectedIndex

### Community 47 - "BaseCard"
Cohesion: 0.22
Nodes (5): BaseCard, .body, AddTaskItem, .body, .body

### Community 48 - "PlannerDestination"
Cohesion: 0.16
Nodes (12): PaymentsDestination, .id, incidents, .label, services, PaymentsScreen, PlannerDestination, events (+4 more)

### Community 49 - "SwitchItem"
Cohesion: 0.33
Nodes (3): SwitchItem, .body, .currentBinding

### Community 50 - ".body"
Cohesion: 0.24
Nodes (4): HomeGreenHeaderCard, .body, HomeTab, .body

### Community 51 - "AddEventItem"
Cohesion: 0.22
Nodes (5): AddEventItem, .body, PlannerEventTab, .body, .body

### Community 52 - "HomeTabsTenantLeaseholder"
Cohesion: 0.25
Nodes (8): HomeTabsTenantLeaseholder, home, .id, .item, payments, planner, profile, roomies

### Community 53 - "LocationInfoMessage"
Cohesion: 0.25
Nodes (5): ListingLocationSection, .body, LocationInfoMessage, .body, .highlightedText

### Community 54 - "TaskItem"
Cohesion: 0.24
Nodes (4): TaskItem, .body, PlannerTasks, .body

### Community 56 - ".body"
Cohesion: 0.25
Nodes (5): ListingGreenCard, ContactButton, .body, ListingDetailScreen, .body

### Community 57 - "MapListingCard"
Cohesion: 0.28
Nodes (3): ExploreList, .body, MapListingCard

### Community 58 - "HomeRoute"
Cohesion: 0.19
Nodes (11): HomeRoute, Home, .id, LeaveRequest, ListingDetails, Messages, NotificationRoute, ProfilePublishPlace (+3 more)

### Community 59 - "ProfileEmptyState"
Cohesion: 0.24
Nodes (4): ProfileEmptyState, .body, ProfileTab, .body

### Community 60 - "RoomieColorTokens"
Cohesion: 0.36
Nodes (5): RoomieColorTokens, RoomiePalette, .ScreenBgBrush, RoomieTheme, .colors

### Community 62 - "BaseGreenCard"
Cohesion: 0.40
Nodes (3): BaseGreenCard, .body, .body

### Community 63 - "ProfileIsTenantInAddress"
Cohesion: 0.08
Nodes (13): ProfileContactSection, .body, ProfileIsTenantInAddress, .body, .currentBinding, ProfileReviewsSection, .body, ProfileScreen (+5 more)

### Community 65 - "View"
Cohesion: 0.36
Nodes (3): ExplorerHeader, PreviewWrapper, .body

### Community 67 - "HomeTabsRegistered"
Cohesion: 0.29
Nodes (7): HomeTabsRegistered, chats, explore, .id, .item, notifications, profile

### Community 68 - "PasswordRecoveryScreen"
Cohesion: 0.22
Nodes (4): View, LoginScreen, PasswordRecoveryScreen, .body

### Community 69 - "OnboardingRoute"
Cohesion: 0.29
Nodes (6): OnboardingRoute, .id, Login, PasswordRecovery, PasswordRecoveryConfirmation, SignIn

### Community 73 - "UserType"
Cohesion: 0.18
Nodes (7): UserType, leaseholder, registered, tenant, unregistered, .body, HomeTabs

### Community 74 - "PaymentIncidentItem"
Cohesion: 0.40
Nodes (3): PaymentIncidentItem, .body, .body

### Community 78 - "NavigationRouter"
Cohesion: 0.17
Nodes (6): PaymentsIncidents, PaymentsServicesTab, .body, NavigationRouter, .isBottomSheetPresented, .body

### Community 86 - "Identifiable"
Cohesion: 0.29
Nodes (3): Place, MapView, .body

### Community 122 - "PublishAddPaymentSection"
Cohesion: 0.09
Nodes (11): PublishAdd, .body, PublishAddPaymentSection, .body, .currentItems, PublishAddMultipleText, .body, PublishAddText (+3 more)

## Knowledge Gaps
- **176 isolated node(s):** `none`, `phone`, `number`, `currency`, `customMask` (+171 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 320 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **69 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `String` connect `String` to `String`, `InputWithLabel`, `ExplorerView`, `SignInScreen`, `RoomieTask`, `StarRatingBar`, `DefaultButton`, `Font Assets & Definitions`, `ListingCardItem`, `BasicText`, `Input`, `BottomSheetRoute`, `InputFormat`, `SettingsRoute`, `BaseSimpleButton`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `HomeTabItem`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `ChatTenantConversationCard`, `GreenCTAButton`, `DropdownInput`, `.navigate`, `RoomieSectionHeader`, `BeigeButton`, `Sendable`, `Color`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `ScreenConfig`, `SharedPaymentBottomSheet`, `SettingOptionItem`, `BaseCard`, `PlannerDestination`, `SwitchItem`, `.body`, `AddEventItem`, `LocationInfoMessage`, `TaskItem`, `.body`, `MapListingCard`, `HomeRoute`, `ProfileEmptyState`, `HomeScaffold`, `ProfileIsTenantInAddress`, `ScreenTopBar`, `EventItem`, `PasswordRecoveryScreen`, `OnboardingRoute`, `BaseScaffold`, `UserType`, `PaymentIncidentItem`, `PaymentRoomieItem`, `HideListingItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `ListingInfoSection`, `Identifiable`, `PasswordRecoveryConfirmationScreen`, `PublishButton`, `ManageListingScreen`, `PublishPhotoItems`, `PublishAddPaymentSection`, `RateRoomie`?**
  _High betweenness centrality (0.438) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `NavigationRouter` (e.g. with `ContentView` and `AppNavHost`) actually correct?**
  _`NavigationRouter` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `none`, `phone`, `number` to the rest of the system?**
  _176 weakly-connected nodes found - possible missing edges._
- **Should `RoomieTask` be split into smaller, more focused modules?**
  _Cohesion score 0.05782312925170068 - nodes in this community are weakly interconnected._
- **Why does `NavigationRouter` connect `NavigationRouter` to `String`, `InputWithLabel`, `ExplorerView`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `DefaultButton`, `ListingPhotoSection`, `ListingCardItem`, `BasicText`, `ListingCreateEditScreen`, `SignInScreen`, `SettingsScreen`, `Input`, `BottomSheetRoute`, `BaseSimpleButton`, `BaseBottomSheet`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `ChatTenantConversationCard`, `GreenCTAButton`, `Observation`, `.navigate`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `Color`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `SharedPaymentBottomSheet`, `SettingOptionItem`, `HomeNavigationBar`, `BaseCard`, `PlannerDestination`, `SwitchItem`, `.body`, `AddEventItem`, `LocationInfoMessage`, `TaskItem`, `HomeScreen`, `.body`, `MapListingCard`, `ProfileEmptyState`, `HomeScaffold`, `BaseGreenCard`, `ProfileIsTenantInAddress`, `ScreenTopBar`, `View`, `EventItem`, `PasswordRecoveryScreen`, `NotificationsScreen`, `PrivacyScreen`, `BaseScaffold`, `PaymentIncidentItem`, `PaymentRoomieItem`, `ExploreMap`, `HideListingItem`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `HomeTabHeader`, `ListingInfoSection`, `Identifiable`, `PasswordRecoveryConfirmationScreen`, `PublishButton`, `ManageListingScreen`, `PublishPhotoItems`, `PublishAddPaymentSection`, `RateRoomie`?**
  _High betweenness centrality (0.156) - this node is a cross-community bridge._
- **Should `DefaultButton` be split into smaller, more focused modules?**
  _Cohesion score 0.07507507507507508 - nodes in this community are weakly interconnected._
- **Why does `SwiftUI` connect `SwiftUI` to `String`, `InputWithLabel`, `ExplorerView`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `DefaultButton`, `Font Assets & Definitions`, `ListingCardItem`, `BasicText`, `Typography & Font Tokens`, `Input`, `BottomSheetRoute`, `InputFormat`, `SettingsRoute`, `BaseSimpleButton`, `BaseBottomSheet`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `ChatTenantConversationCard`, `GreenCTAButton`, `DropdownInput`, `Observation`, `.navigate`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `Color`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `ScreenConfig`, `SharedPaymentBottomSheet`, `SettingOptionItem`, `HomeNavigationBar`, `BaseCard`, `PlannerDestination`, `SwitchItem`, `.body`, `AddEventItem`, `TaskItem`, `HomeScreen`, `.body`, `MapListingCard`, `HomeRoute`, `ProfileEmptyState`, `RoomieColorTokens`, `HomeScaffold`, `BaseGreenCard`, `ProfileIsTenantInAddress`, `ScreenTopBar`, `View`, `EventItem`, `PasswordRecoveryScreen`, `NotificationsScreen`, `PrivacyScreen`, `BaseScaffold`, `UserType`, `PaymentIncidentItem`, `PaymentRoomieItem`, `ExploreMap`, `HideListingItem`, `NavigationRouter`, `RoomieListItem`, `ChangePasswordScreen`, `PersonalInfoScreen`, `HomeTabHeader`, `ListingInfoSection`, `PasswordRecoveryConfirmationScreen`, `PublishButton`, `ManageListingScreen`, `PublishPhotoItems`, `PublishAddPaymentSection`, `RateRoomie`, `SignInScreen`, `SettingsScreen`, `ListingPhotoSection`, `ListingCreateEditScreen`?**
  _High betweenness centrality (0.127) - this node is a cross-community bridge._