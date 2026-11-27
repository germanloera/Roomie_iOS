import SwiftUI

public struct HomeTabHeader: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    var id: Int = -1

    init(id: Int = -1) {
        self.id = id
    }

    public var body: some View {

        HStack(alignment: .center, spacing: 12) {

            switch id {
            case HomeTabsTenantLeaseholder.home.id:

                VStack(alignment: .leading, spacing: 0) {

                    Text("Titular · Roma Norte")
                        .font(.dmSans(.regular, size: 12))
                        .lineSpacing(16 - 12)
                        .foregroundStyle(Color.roomie.mute)

                    Text("Hola, Germán")
                        .font(.fraunces(.regular, size: 24))
                        .lineSpacing(30 - 24)
                        .foregroundStyle(Color.roomie.ink)
                }

                Spacer()

                HStack {
                    Button {
                        router?.navigate(to: HomeRoute.Messages())

                    } label: {
                        Image(systemName: "message")
                            .frame(width: 40.0, height: 40.0)
                            .font(.system(size: 14, weight: .semibold))
                            .glassEffect()
                    }
                    .buttonStyle(.plain)

                    Button {
                        router?.navigate(to: HomeRoute.NotificationRoute())

                    } label: {
                        Image(systemName: "bell")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: 40.0, height: 40.0)
                            .glassEffect()
                    }
                    .buttonStyle(.plain)

                }

            case HomeTabsTenantLeaseholder.payments.id:

                Text("navigation.tab.payments")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

                Spacer()

                Image(systemName: "plus")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 40.0, height: 40.0)
                    .glassEffect()
            case HomeTabsTenantLeaseholder.planner.id:
                Text("navigation.tab.planner")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

            case HomeTabsTenantLeaseholder.roomies.id:
                Text("navigation.tab.roomies")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

            case HomeTabsTenantLeaseholder.profile.id:

                Text("navigation.tab.profile")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

                Spacer()

                Button {
                    router?.navigate(to: SettingsRoute.Settings())
                } label: {

                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 40.0, height: 40.0)
                        .glassEffect()
                }
                .buttonStyle(.plain)

            default: EmptyView()

            }

        }

        .padding(.trailing, 2)
        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)

    }
}
