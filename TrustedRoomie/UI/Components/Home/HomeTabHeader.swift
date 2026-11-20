import SwiftUI

public struct HomeTabHeader: View {

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

                    Image(systemName: "message")
                        .frame(width: 40.0, height: 40.0)
                        .font(.system(size: 14, weight: .semibold))
                        .glassEffect()

                    Image(systemName: "bell")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 40.0, height: 40.0)
                        .glassEffect()
                }

            case HomeTabsTenantLeaseholder.payments.id:

                Text("Pagos")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

                Spacer()

                Image(systemName: "plus")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 40.0, height: 40.0)
                    .glassEffect()
            case HomeTabsTenantLeaseholder.planner.id:
                Text("Agenda")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

            case HomeTabsTenantLeaseholder.roomies.id:
                Text("Roomies")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

            case HomeTabsTenantLeaseholder.profile.id:

                Text("Perfil")
                    .font(.fraunces(.regular, size: 24))
                    .lineSpacing(30 - 24)
                    .foregroundStyle(Color.roomie.ink)

                Spacer()

                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 40.0, height: 40.0)
                    .glassEffect()
            default: EmptyView()

            }

        }

        .padding(.top, 8)
        .padding(.bottom, 12)
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}
