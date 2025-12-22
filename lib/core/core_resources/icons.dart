import '../../core/core_barrel.dart';

export '../extensions/data_types_extensions/extension_icon.dart';

enum AppIcons {
  none(icon: Icons.not_interested),

  ///Admin
  adminPanel(icon: Icons.person_rounded),

  ///General
  close(icon: Icons.close_rounded),
  version(icon: Icons.info_outline_rounded),
  error(icon: Icons.error_outline_rounded),
  threeDots(icon: Icons.more_vert),
  add(icon: Icons.add),
  list(icon: Icons.list),
  sort(icon: Icons.sort_rounded),
  filter(icon: Icons.filter_alt),
  noFilter(icon: Icons.filter_alt_off),
  removeFilter(icon: Icons.highlight_remove_sharp),
  notFound(icon: Icons.do_not_disturb_on_outlined),
  mobile(icon: Icons.phone_android),
  email(icon: Icons.email),
  web(icon: Icons.language),
  info(icon: Icons.info_outline),
  currency(icon: Icons.attach_money_rounded),
  dateTime(icon: Icons.date_range_outlined),
  description(icon: Icons.description_rounded),
  note(icon: Icons.edit_note_rounded),

  ///Page Icons
  home(icon: Icons.home_rounded),
  settings(icon: Icons.settings_rounded),
  about(icon: Icons.info_outline_rounded),
  update(icon: Icons.update_rounded),
  profile(icon: Icons.account_circle_rounded),

  ///List
  listSearch(icon: Icons.search_rounded),
  listSearchRemove(icon: Icons.clear_rounded);

  final IconData icon;
  const AppIcons({required this.icon});

  Icon get widget => Icon(icon);
}
