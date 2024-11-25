import 'package:flutter/material.dart';

import '../extensions/extensions_on_data_types/extension_icon.dart';

class AppIcons {
  static List<Icon> get iconsList => List<Icon>.of([
        none,
        adminPanelIcon,
        close,
        version,
        error,
        threeDots,
        add,
        list,
        sort,
        filter,
        noFilter,
        removeFilter,
        notFound,
        home,
        settings,
        about,
        update,
        profile,
        mobile,
        email,
        web,
        info,
        currency,
        dateTime,
        description,
        note,
        listSearch,
        listSearchRemove,
      ]);

  static Icon get none => const Icon(Icons.not_interested).withPrimaryColor;

  ///Admin
  static Icon get adminPanelIcon => const Icon(Icons.person_rounded);

  ///General
  static Icon get close => const Icon(Icons.close_rounded);
  static Icon get version => const Icon(Icons.info_outline_rounded);
  static Icon get error => const Icon(Icons.error_outline_rounded);
  static Icon get threeDots => const Icon(Icons.more_vert);
  static Icon get add => const Icon(Icons.add);
  static Icon get list => const Icon(Icons.list);
  static Icon get sort => const Icon(Icons.sort_rounded);
  static Icon get filter => const Icon(Icons.filter_alt);
  static Icon get noFilter => const Icon(Icons.filter_alt_off);
  static Icon get removeFilter => const Icon(Icons.highlight_remove_sharp);
  static Icon get notFound => const Icon(Icons.do_not_disturb_on_outlined);
  static Icon get mobile => const Icon(Icons.phone_android);
  static Icon get email => const Icon(Icons.email);
  static Icon get web => const Icon(Icons.language);
  static Icon get info => const Icon(Icons.info_outline);
  static Icon get currency => const Icon(Icons.attach_money_rounded);
  static Icon get dateTime => const Icon(Icons.date_range_outlined);
  static Icon get description => const Icon(Icons.description_rounded);
  static Icon get note => const Icon(Icons.edit_note_rounded);

  ///Page Icons
  static Icon get home => const Icon(Icons.home_rounded);
  static Icon get settings => const Icon(Icons.settings_rounded);
  static Icon get about => const Icon(Icons.info_outline_rounded);
  static Icon get update => const Icon(Icons.update_rounded);
  static Icon get profile => const Icon(Icons.account_circle_rounded);

  ///List
  static Icon get listSearch => const Icon(Icons.search_rounded);
  static Icon get listSearchRemove => const Icon(Icons.clear_rounded);
}
