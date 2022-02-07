import 'package:flutter/material.dart';
import 'package:notes_ignite/i18n/i18n_const.dart';

import '/core/core.dart';

class TextFormNoteWidget extends StatefulWidget {
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final bool expanded;
  final int? maxLines;
  final int? minLines;
  final bool? isAlwaysShown;
  final Function(String?) onSaved;
  const TextFormNoteWidget({
    Key? key,
    required this.onSaved,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.expanded = false,
    this.maxLines = 1,
    this.minLines,
    this.isAlwaysShown,
  }) : super(key: key);

  @override
  State<TextFormNoteWidget> createState() => _TextFormNoteWidgetState();
}

class _TextFormNoteWidgetState extends State<TextFormNoteWidget> {
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    Widget textFormNoteWidget = Scrollbar(
      key: UniqueKey(),
      controller: scrollController,
      showTrackOnHover: widget.isAlwaysShown,
      child: TextFormField(
        scrollController: scrollController,
        expands: widget.expanded,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        onSaved: widget.onSaved,
        style: AppTheme.textStyles.textSimple,
        initialValue: widget.initialValue,
        validator: (text) {
          text = text ?? "";
          return text.isNotEmpty ? null : I18nConst.fieldRequired;
        },
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintStyle: AppTheme.textStyles.textSimple,
          labelStyle: AppTheme.textStyles.textSimple,
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppTheme.colors.border, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppTheme.colors.border, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppTheme.colors.border, width: 1)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
    );
    return widget.expanded
        ? Expanded(child: textFormNoteWidget)
        : Container(child: textFormNoteWidget);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
