# Graph Report - TrustedRoomie  (2026-11-26)

## Corpus Check
- 230 files · ~53,877 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 22 file(s) not represented in the graph (top: .ttf 13, (none) 2, .plist 2)

## Summary
- 1667 nodes · 3453 edges · 155 communities (82 shown, 73 thin omitted)
- Extraction: 90% EXTRACTED · 10% INFERRED · 0% AMBIGUOUS · INFERRED: 334 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `33acd93b`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- String
- InputWithLabel
- PermissionManager
- AppNavHost
- RoomieTask
- StarRatingBar
- ButtonStyle
- Font Assets & Definitions
- ListingCardItem
- ListingReviewCard
- Typography & Font Tokens
- Input
- BottomSheetRoute
- CodingKeys
- SwitchItem
- BaseSimpleButton
- BaseBottomSheet
- ToggleChip
- PaymentPaymentsItem
- SupabaseProvider
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
- SwiftUI
- .body
- RoomieSectionHeader
- BeigeButton
- RoundCheckBox
- String
- SelectedFile
- Color
- MonthlyPaymentItem
- NotifyPaymentBottomSheet
- ScreenConfig
- SharedPaymentBottomSheet
- DocumentPickerRepresentable
- Equatable
- BaseCard
- PlannerDestination
- AuthRepositoryImpl
- .body
- HomeTabHeader
- ViewModifier
- PasswordRecoveryConfirmationScreen
- TaskItem
- HomeScreen
- SupabaseRepository
- User
- LocationError
- ProfileEmptyState
- RoomieColorTokens
- HomeScaffold
- BaseGreenCard
- ProfileSessionStartedState
- ScreenTopBar
- HomeToggleButton
- PermissionStatus
- PermissionType
- PasswordRecoveryScreen
- LogoutBottomSheet
- UserType
- DefaultButton
- UpdateRentBottomSheet
- PermissionManagerProtocol
- PublishCurrentAddress
- Sendable
- View
- HideListingItem
- NavigationRouter
- ExplorerView
- ChangePasswordScreen
- View
- HomeNavigationBar
- ListingInfoSection
- Listing
- LocationModel
- BasicText
- .body
- .body
- CardBackground
- PublishAddPaymentSection
- RateItem
- PublishRules
- InlineNavigationTitleModifier
- Foundation
- NavigationRouter
- AuthResult
- PublishAdd
- PublishAmenities
- PublishNearbyPlaces
- .body
- SettingOptionItem
- PermissionExplanationDialog
- SettingsRedirectAlert
- AddTaskItem
- HomeTabsTenantLeaseholder
- UserSession
- MapView
- PaymentRoomieItem
- CaseIterable
- .body
- PublishButton
- EventItem
- ProfileScreen
- PersonalInfoScreen
- RateRoomie

## God Nodes (most connected - your core abstractions)
1. `NavigationRouter` - 155 edges
2. `PermissionManager` - 33 edges
3. `PermissionStatus` - 31 edges
4. `BaseCard` - 31 edges
5. `Input` - 26 edges
6. `InputFormat` - 25 edges
7. `SelectedFile` - 25 edges
8. `PermissionType` - 23 edges
9. `LocationModel` - 23 edges
10. `SupabaseProvider` - 22 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/Publish/PublishListingInfo.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Screen/Settings/ChangePasswordScreen.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift
- `.body` --calls--> `Input`  [INFERRED]
  TrustedRoomie/UI/Components/Common/InputWithLabel.swift → TrustedRoomie/UI/Components/Common/Input.swift
- `.body` --calls--> `BaseSimpleButton`  [INFERRED]
  TrustedRoomie/UI/Components/BottomSheets/LogoutBottomSheet.swift → TrustedRoomie/UI/Components/Common/BaseSimpleButton.swift
- `.body` --calls--> `PaymentPaymentsItem`  [INFERRED]
  TrustedRoomie/UI/Components/Payments/PaymentsServicesTab.swift → TrustedRoomie/UI/Components/Payments/Items/PaymentPaymentsItem.swift

## Import Cycles
- None detected.

## Communities (155 total, 73 thin omitted)

### Community 0 - "String"
Cohesion: 0.29
Nodes (6): ApartmentHistoryItem, .id, ApartmentItem, .body, ProfileHistory, .body

### Community 1 - "InputWithLabel"
Cohesion: 0.16
Nodes (8): InputWithLabel, .body, LoginScreen, .body, .body, .body, .body, .body

### Community 3 - "AppNavHost"
Cohesion: 0.15
Nodes (6): MyApp, .body, AppNavHost, .body, NavigationScreen, .body

### Community 4 - "RoomieTask"
Cohesion: 0.16
Nodes (4): RoomieTask, NetworkService, NetworkServiceProtocol, ContentViewModel

### Community 5 - "StarRatingBar"
Cohesion: 0.29
Nodes (3): StarRatingBar, .body, .displayText

### Community 6 - "ButtonStyle"
Cohesion: 0.21
Nodes (3): .body, RoomiePineButtonStyle, RoomiePrimaryButtonStyle

### Community 7 - "Font Assets & Definitions"
Cohesion: 0.10
Nodes (21): AppFont, DMSans, extraBold, extraLight, light, medium, .name, regular (+13 more)

### Community 8 - "ListingCardItem"
Cohesion: 0.06
Nodes (24): BaseScaffold, .body, ExploreList, .body, ExploreListingCard, ListingCardItem, MapListingCard, .body (+16 more)

### Community 9 - "ListingReviewCard"
Cohesion: 0.21
Nodes (6): ListingPlaceReviews, .body, ListingReviewCard, .highlightedText, ListingTenantReview, .body

### Community 10 - "Typography & Font Tokens"
Cohesion: 0.11
Nodes (18): Font, RoomieFontTokens, RoomieTextStyle, bodyLarge, bodyMedium, displayLarge, displayMedium, .font (+10 more)

### Community 14 - "Input"
Cohesion: 0.05
Nodes (27): InputFormat, currency, customMask, .keyboardType, none, number, phone, ChatMessageBox (+19 more)

### Community 15 - "BottomSheetRoute"
Cohesion: 0.14
Nodes (9): BottomSheetRoute, custom, deleteListing, .id, logout, notifyLeave, notifyPayment, sharedPayment (+1 more)

### Community 16 - "CodingKeys"
Cohesion: 0.05
Nodes (42): CodingKeys, createdAt, id, name, phone, relation, updatedAt, userId (+34 more)

### Community 17 - "SwitchItem"
Cohesion: 0.06
Nodes (18): SwitchItem, .currentBinding, ProfileIsTenantInAddress, .body, .currentBinding, SettingsRoute, ChangePasswordScreen, .id (+10 more)

### Community 18 - "BaseSimpleButton"
Cohesion: 0.08
Nodes (15): DeleteListingBottomSheet, .body, .currentBinding, DeleteListingBottomSheetContent, .body, NotifyLeaveBottomSheet, .body, .currentBinding (+7 more)

### Community 19 - "BaseBottomSheet"
Cohesion: 0.26
Nodes (3): BaseBottomSheet, .body, View

### Community 20 - "ToggleChip"
Cohesion: 0.10
Nodes (11): ToggleChip, .backgroundColor, .body, .currentBinding, .selectedValue, .textColor, FlowLayout, LeaveRequest (+3 more)

### Community 21 - "PaymentPaymentsItem"
Cohesion: 0.31
Nodes (4): PaymentPaymentsItem, .body, .titleFont, RoomiePaymentEntry

### Community 22 - "SupabaseProvider"
Cohesion: 0.09
Nodes (9): SupabaseProvider, .state, .statePublisher, .states, SupabaseState, .description, error, initializing (+1 more)

### Community 23 - "PublishAddSection"
Cohesion: 0.24
Nodes (3): PublishAddSection, .body, .currentItems

### Community 24 - "HomeTabItem"
Cohesion: 0.17
Nodes (14): HomeTabItem, HomeTabsRegistered, chats, explore, .id, .item, notifications, profile (+6 more)

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
Cohesion: 0.14
Nodes (9): ChatBalloonLeft, .balloonShape, .body, ChatBalloonRight, .balloonShape, .body, RoomInfoPill, .highlightedText (+1 more)

### Community 29 - "BottomCTAButton"
Cohesion: 0.24
Nodes (5): BottomCTAButton, .subtitleTextColor, .body, .body, .body

### Community 30 - "ChatTenantConversationCard"
Cohesion: 0.21
Nodes (6): ChatTenantConversationCard, .body, ChatTab, .body, ChatTabContent, .body

### Community 31 - "GreenCTAButton"
Cohesion: 0.24
Nodes (6): GreenCTAButton, .body, GreenCTAButtonStyle, RedCTAButton, .body, .body

### Community 32 - "DropdownInput"
Cohesion: 0.09
Nodes (18): DropdownOption, DropdownInput, .body, .currentOption, .floatingMenu, .resolvedErrorMessage, .shouldShowError, DropdownPreviewContainer (+10 more)

### Community 33 - "SwiftUI"
Cohesion: 0.14
Nodes (8): MapKit, Observation, Photos, SwiftUI, ExploreTab, RoomieRadius, ExploreTabViewModel, UserNotifications

### Community 34 - ".body"
Cohesion: 0.12
Nodes (8): ProfileContactSection, .body, ProfileCurrentAddress, ProfilePublishPlaceItem, .body, ProfileReviewsSection, .body, .body

### Community 35 - "RoomieSectionHeader"
Cohesion: 0.12
Nodes (8): LeavingRequestNotification, .body, RoomieListItem, .body, RoomieSectionHeader, .body, RoomiesTab, .body

### Community 36 - "BeigeButton"
Cohesion: 0.28
Nodes (3): BeigeButton, .body, BeigeButtonStyle

### Community 37 - "RoundCheckBox"
Cohesion: 0.23
Nodes (6): RoundCheckBox, .body, .currentBgColor, .currentBinding, .currentBorderColor, .isChecked

### Community 38 - "String"
Cohesion: 0.19
Nodes (3): EmptyExampleView, String, InputRestriction

### Community 39 - "SelectedFile"
Cohesion: 0.05
Nodes (14): FilePickerMode, .defaultDocumentTypes, documents, photos, SelectedFile, .formattedSize, .isImage, FilePickerRepository (+6 more)

### Community 40 - "Color"
Cohesion: 0.19
Nodes (4): SendInviteBottomBar, LeaveRequestBottomBar, Color, .roomie

### Community 41 - "MonthlyPaymentItem"
Cohesion: 0.27
Nodes (6): ListingMonthlyPaymentCard, .body, ListingMonthlySectionItem, .body, MonthlyPaymentItem, .id

### Community 42 - "NotifyPaymentBottomSheet"
Cohesion: 0.29
Nodes (5): NotifyPaymentBottomSheet, .body, .currentBinding, NotifyPaymentBottomSheetContent, .body

### Community 44 - "SharedPaymentBottomSheet"
Cohesion: 0.29
Nodes (5): SharedPaymentBottomSheet, .body, .currentBinding, SharedPaymentBottomSheetContent, .body

### Community 46 - "Equatable"
Cohesion: 0.13
Nodes (9): BaseViewModel, UiEvent, navigate, showSnackbar, UiState, error, idle, loading (+1 more)

### Community 47 - "BaseCard"
Cohesion: 0.20
Nodes (6): BaseCard, .body, .body, AddEventItem, .body, .body

### Community 48 - "PlannerDestination"
Cohesion: 0.16
Nodes (12): PaymentsDestination, .id, incidents, .label, services, PaymentsScreen, PlannerDestination, events (+4 more)

### Community 49 - "AuthRepositoryImpl"
Cohesion: 0.19
Nodes (4): AuthRepositoryImpl, .session, .sessionPublisher, CancellableHolder

### Community 50 - ".body"
Cohesion: 0.24
Nodes (4): HomeGreenHeaderCard, .body, HomeTab, .body

### Community 51 - "HomeTabHeader"
Cohesion: 0.22
Nodes (5): HomeTabHeader, .body, PlannerEventTab, .body, .body

### Community 52 - "ViewModifier"
Cohesion: 0.21
Nodes (4): AppBackground, RoomieCardModifier, RoomieGlassCardModifier, View

### Community 56 - "SupabaseRepository"
Cohesion: 0.19
Nodes (4): EmergencyContact, SupabaseRepository, SupabaseRepositoryProtocol, UserUpdatePayload

### Community 57 - "User"
Cohesion: 0.19
Nodes (6): User, UserRole, leaseholder, new, registered, tenant

### Community 58 - "LocationError"
Cohesion: 0.06
Nodes (20): LocationError, emptyAddress, .errorDescription, geocodingFailed, permissionDenied, .requiresSettingsRedirect, servicesDisabled, timeout (+12 more)

### Community 59 - "ProfileEmptyState"
Cohesion: 0.24
Nodes (4): ProfileEmptyState, .body, ProfileTab, .body

### Community 60 - "RoomieColorTokens"
Cohesion: 0.36
Nodes (5): RoomieColorTokens, RoomiePalette, .ScreenBgBrush, RoomieTheme, .colors

### Community 62 - "BaseGreenCard"
Cohesion: 0.40
Nodes (3): BaseGreenCard, .body, .body

### Community 63 - "ProfileSessionStartedState"
Cohesion: 0.39
Nodes (3): ProfileHeader, .body, ProfileSessionStartedState

### Community 65 - "HomeToggleButton"
Cohesion: 0.24
Nodes (7): .body, HomeToggleButton, .body, PreviewContainer, .body, ViewToggleButtons, .body

### Community 66 - "PermissionStatus"
Cohesion: 0.17
Nodes (10): PermissionStatus, authorized, .canRequestDirectly, denied, .displayName, .isAuthorized, limited, notDetermined (+2 more)

### Community 67 - "PermissionType"
Cohesion: 0.18
Nodes (9): PermissionType, .id, locationWhenInUse, notifications, photoLibrary, .rationaleDescription, .systemImage, .title (+1 more)

### Community 68 - "PasswordRecoveryScreen"
Cohesion: 0.22
Nodes (3): View, PasswordRecoveryScreen, SignInScreen

### Community 69 - "LogoutBottomSheet"
Cohesion: 0.26
Nodes (6): LogoutBottomSheet, .body, .currentBinding, LogoutBottomSheetContent, .body, .descriptionText

### Community 70 - "UserType"
Cohesion: 0.18
Nodes (7): UserType, leaseholder, registered, tenant, unregistered, .body, HomeTabs

### Community 71 - "DefaultButton"
Cohesion: 0.24
Nodes (4): DefaultButton, .body, DefaultButtonStyle, .body

### Community 72 - "UpdateRentBottomSheet"
Cohesion: 0.29
Nodes (5): UpdateRentBottomSheet, .body, .currentBinding, UpdateRentBottomSheetContent, .body

### Community 74 - "PublishCurrentAddress"
Cohesion: 0.20
Nodes (7): PublishCurrentAddress, .body, .currentAddress1, .currentAddress2, .currentCity, .currentState, .currentZipCode

### Community 75 - "Sendable"
Cohesion: 0.15
Nodes (10): FlagsmithClient, FlagsmithService, FlagsmithServiceImpl, FlagsmithConfigProvider, SupabaseConfig, SupabaseConfigError, .errorDescription, missingSupabaseKey (+2 more)

### Community 76 - "View"
Cohesion: 0.29
Nodes (5): ContentView, .body, ExploreMap, .body, RoomieShapes

### Community 78 - "NavigationRouter"
Cohesion: 0.15
Nodes (7): PaymentIncidentItem, .body, PaymentsIncidents, .body, PaymentsServicesTab, .body, .body

### Community 79 - "ExplorerView"
Cohesion: 0.25
Nodes (7): ExplorerHeader, PreviewWrapper, .body, ExplorerView, .id, list, map

### Community 83 - "HomeNavigationBar"
Cohesion: 0.29
Nodes (3): HomeNavigationBar, .body, .selectedIndex

### Community 85 - "Listing"
Cohesion: 0.19
Nodes (5): Listing, ListingStatus, disponible, oculto, pendiente

### Community 86 - "LocationModel"
Cohesion: 0.10
Nodes (11): LocationModel, .coordinate, .formattedCoordinates, Place, LocationRepositoryProtocol, OnboardingRoute, .id, Login (+3 more)

### Community 87 - "BasicText"
Cohesion: 0.15
Nodes (9): BasicText, .body, .body, ListingLocationSection, .body, LocationInfoMessage, .body, .highlightedText (+1 more)

### Community 122 - "PublishAddPaymentSection"
Cohesion: 0.22
Nodes (4): PublishAddPaymentSection, .body, .currentItems, .body

### Community 132 - "Foundation"
Cohesion: 0.15
Nodes (7): Combine, CoreLocation, Foundation, PhotosUI, Supabase, AppRemoteConfigConstants, UniformTypeIdentifiers

### Community 133 - "NavigationRouter"
Cohesion: 0.10
Nodes (13): ListingClosePlacesCard, .body, ListingPlaceItem, .body, ListingGreenCard, ListingPhotoSection, .body, NavigationRouter (+5 more)

### Community 134 - "AuthResult"
Cohesion: 0.25
Nodes (4): AuthRepository, AuthResult, error, success

### Community 139 - ".body"
Cohesion: 0.24
Nodes (3): PublishSharedServices, ListingCreateEditScreen, .body

### Community 140 - "SettingOptionItem"
Cohesion: 0.42
Nodes (4): SettingOptionItem, .body, SettingOptionItemContent, .body

### Community 143 - "AddTaskItem"
Cohesion: 0.25
Nodes (4): AddTaskItem, .body, PlannerTasks, .body

### Community 144 - "HomeTabsTenantLeaseholder"
Cohesion: 0.29
Nodes (7): HomeTabsTenantLeaseholder, home, .id, payments, planner, profile, roomies

### Community 145 - "UserSession"
Cohesion: 0.29
Nodes (6): UserSession, anonymous, authenticated, error, guest, loading

### Community 146 - "MapView"
Cohesion: 0.33
Nodes (3): MapView, .body, .body

### Community 148 - "CaseIterable"
Cohesion: 0.40
Nodes (4): RoomType, shared, single, suite

## Knowledge Gaps
- **274 isolated node(s):** `id`, `userId`, `name`, `relation`, `phone` (+269 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 469 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **73 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `String` connect `String` to `String`, `InputWithLabel`, `RoomieTask`, `StarRatingBar`, `Font Assets & Definitions`, `ListingCardItem`, `ListingReviewCard`, `Input`, `BottomSheetRoute`, `CodingKeys`, `SwitchItem`, `BaseSimpleButton`, `ToggleChip`, `PaymentPaymentsItem`, `SupabaseProvider`, `PublishAddSection`, `HomeTabItem`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `ChatTenantConversationCard`, `GreenCTAButton`, `DropdownInput`, `.body`, `RoomieSectionHeader`, `BeigeButton`, `SelectedFile`, `Color`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `ScreenConfig`, `SharedPaymentBottomSheet`, `Equatable`, `BaseCard`, `PlannerDestination`, `.body`, `PasswordRecoveryConfirmationScreen`, `TaskItem`, `SupabaseRepository`, `User`, `LocationError`, `ProfileEmptyState`, `HomeScaffold`, `ProfileSessionStartedState`, `ScreenTopBar`, `HomeToggleButton`, `PermissionStatus`, `PermissionType`, `PasswordRecoveryScreen`, `LogoutBottomSheet`, `UserType`, `DefaultButton`, `UpdateRentBottomSheet`, `PublishCurrentAddress`, `Sendable`, `View`, `HideListingItem`, `NavigationRouter`, `ExplorerView`, `ChangePasswordScreen`, `ListingInfoSection`, `Listing`, `LocationModel`, `BasicText`, `.body`, `PublishAddPaymentSection`, `RateItem`, `PublishRules`, `InlineNavigationTitleModifier`, `Foundation`, `NavigationRouter`, `AuthResult`, `PublishAdd`, `PublishAmenities`, `PublishNearbyPlaces`, `.body`, `SettingOptionItem`, `SettingsRedirectAlert`, `AddTaskItem`, `UserSession`, `PaymentRoomieItem`, `CaseIterable`, `PublishButton`, `EventItem`, `PersonalInfoScreen`, `RateRoomie`?**
  _High betweenness centrality (0.562) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `NavigationRouter` (e.g. with `ContentView` and `AppNavHost`) actually correct?**
  _`NavigationRouter` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `id`, `userId`, `name` to the rest of the system?**
  _274 weakly-connected nodes found - possible missing edges._
- **Should `Font Assets & Definitions` be split into smaller, more focused modules?**
  _Cohesion score 0.10160427807486631 - nodes in this community are weakly interconnected._
- **Why does `SwiftUI` connect `SwiftUI` to `String`, `InputWithLabel`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `ButtonStyle`, `Font Assets & Definitions`, `ListingCardItem`, `ListingReviewCard`, `Typography & Font Tokens`, `Input`, `SwitchItem`, `BaseSimpleButton`, `BaseBottomSheet`, `ToggleChip`, `PaymentPaymentsItem`, `PublishAddSection`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `ChatTenantConversationCard`, `GreenCTAButton`, `DropdownInput`, `.body`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `String`, `SelectedFile`, `Color`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `ScreenConfig`, `SharedPaymentBottomSheet`, `DocumentPickerRepresentable`, `BaseCard`, `PlannerDestination`, `.body`, `HomeTabHeader`, `ViewModifier`, `PasswordRecoveryConfirmationScreen`, `TaskItem`, `HomeScreen`, `LocationError`, `ProfileEmptyState`, `RoomieColorTokens`, `HomeScaffold`, `BaseGreenCard`, `ProfileSessionStartedState`, `ScreenTopBar`, `HomeToggleButton`, `PasswordRecoveryScreen`, `LogoutBottomSheet`, `UserType`, `DefaultButton`, `UpdateRentBottomSheet`, `PublishCurrentAddress`, `View`, `HideListingItem`, `NavigationRouter`, `ExplorerView`, `ChangePasswordScreen`, `View`, `HomeNavigationBar`, `ListingInfoSection`, `BasicText`, `.body`, `.body`, `CardBackground`, `PublishAddPaymentSection`, `RateItem`, `PublishRules`, `InlineNavigationTitleModifier`, `Foundation`, `NavigationRouter`, `PublishAdd`, `PublishAmenities`, `PublishNearbyPlaces`, `.body`, `SettingOptionItem`, `PermissionExplanationDialog`, `SettingsRedirectAlert`, `AddTaskItem`, `PaymentRoomieItem`, `PublishButton`, `EventItem`, `ProfileScreen`, `PersonalInfoScreen`, `RateRoomie`?**
  _High betweenness centrality (0.130) - this node is a cross-community bridge._
- **Should `ListingCardItem` be split into smaller, more focused modules?**
  _Cohesion score 0.05803921568627451 - nodes in this community are weakly interconnected._
- **Why does `NavigationRouter` connect `NavigationRouter` to `String`, `InputWithLabel`, `PublishRules`, `AppNavHost`, `PersonalInfoScreen`, `StarRatingBar`, `RateRoomie`, `ListingCardItem`, `ListingReviewCard`, `PublishAdd`, `PublishAmenities`, `SettingOptionItem`, `PublishNearbyPlaces`, `Input`, `.body`, `AddTaskItem`, `SwitchItem`, `BaseSimpleButton`, `BaseBottomSheet`, `ToggleChip`, `MapView`, `PublishButton`, `PublishAddSection`, `PaymentPaymentsItem`, `BaseListingCardSection`, `Chip`, `NotificationItemCard`, `ChatBalloonLeft`, `BottomCTAButton`, `ChatTenantConversationCard`, `GreenCTAButton`, `EventItem`, `SwiftUI`, `.body`, `RoomieSectionHeader`, `RoundCheckBox`, `String`, `Color`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `SharedPaymentBottomSheet`, `BaseCard`, `PlannerDestination`, `.body`, `HomeTabHeader`, `PasswordRecoveryConfirmationScreen`, `TaskItem`, `HomeScreen`, `ProfileEmptyState`, `HomeScaffold`, `BaseGreenCard`, `ProfileSessionStartedState`, `ScreenTopBar`, `HomeToggleButton`, `PasswordRecoveryScreen`, `LogoutBottomSheet`, `UpdateRentBottomSheet`, `PublishCurrentAddress`, `View`, `HideListingItem`, `NavigationRouter`, `ExplorerView`, `BottomSheetRoute`, `ChangePasswordScreen`, `HomeNavigationBar`, `ListingInfoSection`, `BasicText`, `PaymentRoomieItem`, `.body`, `.body`, `PublishAddPaymentSection`, `RateItem`, `ProfileScreen`?**
  _High betweenness centrality (0.074) - this node is a cross-community bridge._