import SwiftUI
import Observation

struct ContentView: View {
    @State private var viewModel = ContentViewModel()
    @State private var router = NavigationRouter()
    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack(spacing: 0) {
                // Banner de error estilizado con tokens Roomie
                if let errorMessage = viewModel.errorMessage {
                    HStack(spacing: 12) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundStyle(Color.roomie.error)
                            .font(.system(size: 18))

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Error al cargar")
                                .roomieFont(.labelLarge)
                                .foregroundStyle(Color.roomie.ink)

                            Text(errorMessage)
                                .roomieFont(.bodyMedium)
                                .foregroundStyle(Color.roomie.mute)
                        }

                        Spacer()
                    }
                    .padding(14)
                    .background(Color.roomie.error.opacity(0.12))
                    .clipShape(RoomieShapes.small)
                    .overlay(
                        RoomieShapes.small
                            .stroke(Color.roomie.error.opacity(0.25), lineWidth: 1)
                    )
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                }

                // Contenido principal de tareas
                if viewModel.isLoading && viewModel.tasks.isEmpty {
                    Spacer()
                    VStack(spacing: 12) {
                        ProgressView()
                            .tint(Color.roomie.pine)
                        Text("Cargando tareas...")
                            .roomieFont(.bodyMedium)
                            .foregroundStyle(Color.roomie.mute)
                    }
                    Spacer()
                } else {
                    List {
                        Section {
                            ForEach(viewModel.tasks) { task in
                                taskRow(task)
                                    .listRowBackground(Color.clear)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                            }
                            .onDelete(perform: viewModel.deleteTask)
                        } header: {
                            Text("Tareas del Hogar")
                                .roomieFont(.titleMedium)
                                .foregroundStyle(Color.roomie.pine)
                                .textCase(nil)
                                .padding(.leading, 4)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .overlay {
                        if viewModel.tasks.isEmpty && !viewModel.isLoading {
                            ContentUnavailableView {
                                Label("Sin tareas", systemImage: "tray")
                                    .roomieFont(.headlineLarge)
                                    .foregroundStyle(Color.roomie.ink)
                            } description: {
                                Text("No hay tareas pendientes en el departamento.")
                                    .roomieFont(.bodyMedium)
                                    .foregroundStyle(Color.roomie.mute)
                            }
                        }
                    }
                    .refreshable {
                        await viewModel.loadTasks()
                    }
                }

                // Barra inferior de entrada para nueva tarea
                HStack(spacing: 12) {
                    HStack {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(Color.roomie.mute)

                        TextField("Nueva tarea para roomies...", text: $newTaskTitle)
                            .roomieFont(.bodyLarge)
                            .foregroundStyle(Color.roomie.ink)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(Color.roomie.card)
                    .clipShape(RoomieShapes.small)
                    .overlay(
                        RoomieShapes.small
                            .stroke(Color.roomie.line, lineWidth: 1)
                    )

                    Button("Agregar") {
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }
                    .buttonStyle(RoomiePrimaryButtonStyle())
                    .disabled(newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                    .opacity(newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty ? 0.5 : 1.0)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.roomie.paper)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.roomie.line),
                    alignment: .top
                )
            }
            .roomieBackground()
            .navigationTitle(viewModel.greeting)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                       // router.navigate(to: .emptyExample(title: "Pantalla de Ejemplo"))
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Ejemplo")
                        }
                        .roomieFont(.labelLarge)
                        .foregroundStyle(Color.roomie.pine)
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            await viewModel.loadTasks()
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundStyle(Color.roomie.pine)
                    }
                    .disabled(viewModel.isLoading)
                }
            }
            .withAppNavigation()
            .task {
                await viewModel.loadTasks()
            }
        }
        .environment(router)
        .tint(Color.roomie.pine)
    }

    // MARK: - Subviews

    @ViewBuilder
    private func taskRow(_ task: RoomieTask) -> some View {
        HStack(spacing: 12) {
            Button {
                viewModel.toggleTaskCompletion(for: task)
            } label: {
                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 20))
                    .foregroundStyle(task.completed ? Color.roomie.ok : Color.roomie.mute)
            }
            .buttonStyle(.plain)

            Text(task.title)
                .roomieFont(.bodyLarge)
                .strikethrough(task.completed, color: Color.roomie.mute)
                .foregroundStyle(task.completed ? Color.roomie.mute : Color.roomie.ink)

            Spacer()
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Color.roomie.card)
        .clipShape(RoomieShapes.medium)
        .overlay(
            RoomieShapes.medium
                .stroke(Color.roomie.line, lineWidth: 1)
        )
    }
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
