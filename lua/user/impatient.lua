local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

if not impatient then
  return
end

impatient.enable_profile()
