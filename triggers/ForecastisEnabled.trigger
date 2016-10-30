Trigger ForecastisEnabled on User (before insert, before update) {
for (User Us : Trigger.new) {
Us.ForecastEnabled = true;
}
}