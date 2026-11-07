#!/usr/bin/env python3
"""Check invokes against a table of real Android signatures.

apktool assembles a method reference without resolving it, so a wrong arity
compiles cleanly and only fails on the device. `Drawable.setBounds(II)V` shipped
that way: the reference does not resolve, ART rejects the class, and because the
rejection happens at class load the method's own catch never runs and no app-level
diagnostic is written. Only a signature table catches this before a device run.
"""
import re
import sys

# owner -> name -> set of valid parameter lists
KNOWN = {
    "Landroid/graphics/drawable/Drawable;": {
        "setBounds": {"IIII"}, "setTint": {"I"}, "getIntrinsicWidth": {""},
        "getIntrinsicHeight": {""}, "setAlpha": {"I"},
    },
    "Landroid/view/View;": {
        "setPadding": {"IIII"}, "setVisibility": {"I"}, "setBackgroundColor": {"I"},
        "setBackgroundResource": {"I"}, "setElevation": {"F"}, "setId": {"I"},
        "setMinimumHeight": {"I"}, "setMinimumWidth": {"I"}, "setClickable": {"Z"},
        "setOnClickListener": {"Landroid/view/View$OnClickListener;"},
    },
    "Landroid/widget/TextView;": {
        "setText": {"Ljava/lang/CharSequence;"}, "setTextSize": {"F", "IF"},
        "setTextColor": {"I", "Landroid/content/res/ColorStateList;"},
        "setGravity": {"I"}, "setSingleLine": {"Z", ""}, "setMaxLines": {"I"},
        "setTypeface": {"Landroid/graphics/Typeface;", "Landroid/graphics/Typeface;I"},
        "setCompoundDrawables": {
            "Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;"
            "Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;"},
        "setCompoundDrawablePadding": {"I"},
        "setCompoundDrawableTintList": {"Landroid/content/res/ColorStateList;"},
    },
    "Landroid/widget/LinearLayout;": {
        "setOrientation": {"I"}, "setGravity": {"I"}, "setWeightSum": {"F"},
        "addView": {"Landroid/view/View;", "Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;",
                    "Landroid/view/View;I"},
    },
    "Landroid/widget/ImageView;": {
        "setImageResource": {"I"}, "setScaleType": {"Landroid/widget/ImageView$ScaleType;"},
        "setImageDrawable": {"Landroid/graphics/drawable/Drawable;"},
    },
    "Landroid/content/res/Resources;": {
        "getColor": {"I", "ILandroid/content/res/Resources$Theme;"},
        "getDrawable": {"I", "ILandroid/content/res/Resources$Theme;"},
        "getIdentifier": {"Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;"},
        "getDimensionPixelSize": {"I"},
    },
    "Landroid/util/Log;": {
        "w": {"Ljava/lang/String;Ljava/lang/String;",
              "Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;"},
        "i": {"Ljava/lang/String;Ljava/lang/String;"},
        "e": {"Ljava/lang/String;Ljava/lang/String;",
              "Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;"},
    },
    "Landroid/content/res/ColorStateList;": {"valueOf": {"I"}},
    "Landroid/view/ViewGroup$MarginLayoutParams;": {"<init>": {"II"}},
    "Landroid/widget/LinearLayout$LayoutParams;": {"<init>": {"II", "III", "IIF"}},
}
INVOKE = re.compile(r"invoke-\w+(?:/range)? \{[^}]*\}, (L[\w/$]+;)->([\w<>]+)\(([^)]*)\)")


def check(path):
    problems = []
    method = "?"
    for line in open(path, encoding="utf-8"):
        st = line.split("#", 1)[0].strip()
        if st.startswith(".method"):
            method = st.split()[-1].split("(")[0]
        m = INVOKE.search(st)
        if not m:
            continue
        owner, name, args = m.groups()
        table = KNOWN.get(owner)
        if table and name in table and args not in table[name]:
            problems.append(f"{path}: {method}: {owner}->{name}({args}) is not a real signature; "
                            f"expected one of {sorted(table[name])}")
    return problems


def main():
    problems = []
    for path in sys.argv[1:]:
        problems.extend(check(path))
    for p in problems:
        print(p)
    print(f"signature check: {len(problems)} problem(s) across {len(sys.argv) - 1} file(s)")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
