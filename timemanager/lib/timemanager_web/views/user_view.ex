defmodule TimemanagerWeb.UserView do
  use TimemanagerWeb, :view
  alias TimemanagerWeb.UserView
  alias TimemanagerWeb.RoleView
  # alias TimemanagerWeb.WTView
  # alias TimemanagerWeb.ClockView


  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      role: RoleView.render("show.json", %{role: user.role}).data.name
      # workingtimes: WTView.render("wt.json", %{wt: user.workingtimes}),
      # clocks: ClockView.render("index.json", %{clocks: user.clocks})

      # clocks: %{data: render_many(user.clocks, ClockView, "clock.json", as: :clock)}

    }
  end
end
