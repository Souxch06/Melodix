.class public final Lcom/melodix/music/SettingsActivity$a;
.super Lcu0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcu0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final O()Ljava/lang/String;
    .locals 6

    .line 1
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 2
    .line 3
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ProxyType"

    .line 8
    .line 9
    const-string v2, "none"

    .line 10
    .line 11
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    move-object v0, v2

    .line 18
    :cond_0
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v3, "ProxyHost"

    .line 23
    .line 24
    const-string v4, ""

    .line 25
    .line 26
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move-object v4, v1

    .line 34
    :goto_0
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v3, "ProxyPort"

    .line 39
    .line 40
    const-string v5, "0"

    .line 41
    .line 42
    invoke-interface {v1, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move-object v5, v1

    .line 50
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_4

    .line 55
    .line 56
    invoke-static {v4}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_3
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const-string v0, " \u2192 "

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v0, ":"

    .line 86
    .line 87
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    return-object v0

    .line 98
    :cond_4
    :goto_2
    const-string v0, "Disabled (direct connection)"

    .line 99
    .line 100
    return-object v0
.end method

.method public static final P(Landroid/content/Context;Ljava/util/ArrayList;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 8
    .line 9
    .line 10
    const/16 v2, 0x10

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 13
    .line 14
    .line 15
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    const/4 v4, -0x1

    .line 18
    const/4 v5, -0x2

    .line 19
    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3, v1, v1, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Landroid/widget/EditText;

    .line 29
    .line 30
    invoke-direct {v3, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    const-string p3, "https://example.com/hosts.txt"

    .line 37
    .line 38
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    const-string p3, "#80FFFFFF"

    .line 42
    .line 43
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    const/high16 p3, 0x41700000    # 15.0f

    .line 54
    .line 55
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setInputType(I)V

    .line 59
    .line 60
    .line 61
    new-instance p3, Landroid/graphics/drawable/GradientDrawable;

    .line 62
    .line 63
    invoke-direct {p3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v4, "#282828"

    .line 67
    .line 68
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    invoke-virtual {p3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 73
    .line 74
    .line 75
    const/high16 v4, 0x41800000    # 16.0f

    .line 76
    .line 77
    invoke-virtual {p3, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    const/16 p3, 0x20

    .line 84
    .line 85
    const/16 v4, 0x18

    .line 86
    .line 87
    invoke-virtual {v3, p3, v4, p3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 88
    .line 89
    .line 90
    const/16 p3, 0x30

    .line 91
    .line 92
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 93
    .line 94
    .line 95
    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    .line 96
    .line 97
    const/high16 v4, 0x3f800000    # 1.0f

    .line 98
    .line 99
    invoke-direct {p3, v1, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    new-instance p3, Landroid/widget/TextView;

    .line 112
    .line 113
    invoke-direct {p3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 114
    .line 115
    .line 116
    const-string p0, "\u274c"

    .line 117
    .line 118
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    const/high16 p0, 0x41600000    # 14.0f

    .line 122
    .line 123
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 124
    .line 125
    .line 126
    const/16 p0, 0x14

    .line 127
    .line 128
    const/16 v1, 0x8

    .line 129
    .line 130
    invoke-virtual {p3, p0, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 131
    .line 132
    .line 133
    new-instance p0, Lf61;

    .line 134
    .line 135
    invoke-direct {p0, p1, v3, p2, v0}, Lf61;-><init>(Ljava/util/ArrayList;Landroid/widget/EditText;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public static final Q(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 11

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-static {p0, v1}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    move v3, v2

    .line 18
    :goto_0
    if-ge v3, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    add-int/lit8 v3, v3, 0x1

    .line 25
    .line 26
    check-cast v4, Landroid/widget/EditText;

    .line 27
    .line 28
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-static {v4}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    new-instance v5, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    :cond_1
    :goto_1
    if-ge v2, p0, :cond_2

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    move-object v3, v1

    .line 66
    check-cast v3, Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-lez v3, :cond_1

    .line 73
    .line 74
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    const/4 v9, 0x0

    .line 79
    const/16 v10, 0x3e

    .line 80
    .line 81
    const-string v6, ", "

    .line 82
    .line 83
    const/4 v7, 0x0

    .line 84
    const/4 v8, 0x0

    .line 85
    invoke-static/range {v5 .. v10}, Lbl;->B(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr80;I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method

.method public static final R(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lh70;->H()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lbh;->n(Landroid/content/Context;)Le2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Le2;->b:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "Active: "

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->u(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    if-eqz p1, :cond_1

    .line 34
    .line 35
    const-string p0, "No saved profile active"

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->u(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public static final S(Landroidx/preference/Preference;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-lez v1, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Lda1;->I(Ljava/lang/CharSequence;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "Active: "

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v0, " line(s) of custom CSS rules"

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->u(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    if-eqz p0, :cond_1

    .line 51
    .line 52
    const-string v0, "Inject custom CSS styles into the Web Player"

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->u(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public static final T(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lh70;->l()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x7f030000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lh70;->l()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const v1, 0x7f030001

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-static {p0, p2}, Lia;->R([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-ltz p0, :cond_0

    .line 33
    .line 34
    array-length v1, v0

    .line 35
    if-ge p0, v1, :cond_0

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    aget-object p0, v0, p0

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->u(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    if-eqz p1, :cond_2

    .line 46
    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const-string p2, "Legacy (Connection-Verified)"

    .line 51
    .line 52
    :goto_0
    invoke-virtual {p1, p2}, Landroidx/preference/Preference;->u(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public static final U(Ljava/util/List;Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x6

    .line 3
    if-ge v0, v1, :cond_4

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Landroid/widget/ImageButton;

    .line 10
    .line 11
    if-ltz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v0, v2, :cond_0

    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    const-string v2, "NONE"

    .line 25
    .line 26
    :goto_1
    check-cast v2, Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_2

    .line 37
    .line 38
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    move-object v5, v4

    .line 43
    check-cast v5, Lcom/melodix/music/e;

    .line 44
    .line 45
    iget-object v5, v5, Lcom/melodix/music/e;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v5, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    const/4 v4, 0x0

    .line 55
    :goto_2
    check-cast v4, Lcom/melodix/music/e;

    .line 56
    .line 57
    if-eqz v4, :cond_3

    .line 58
    .line 59
    iget v2, v4, Lcom/melodix/music/e;->c:I

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_3
    const v2, 0x106000d

    .line 63
    .line 64
    .line 65
    :goto_3
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 66
    .line 67
    .line 68
    add-int/lit8 v0, v0, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    return-void
.end method


# virtual methods
.method public final N(Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcu0;->e0:Lju0;

    .line 2
    .line 3
    if-eqz v0, :cond_19

    .line 4
    .line 5
    invoke-virtual {p0}, Lh70;->H()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x1

    .line 10
    iput-boolean v2, v0, Lju0;->e:Z

    .line 11
    .line 12
    new-instance v3, Liu0;

    .line 13
    .line 14
    invoke-direct {v3, v1, v0}, Liu0;-><init>(Landroid/content/Context;Lju0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const v4, 0x7f140005

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :try_start_0
    invoke-virtual {v3, v1}, Liu0;->c(Landroid/content/res/XmlResourceParser;)Landroidx/preference/PreferenceGroup;

    .line 29
    .line 30
    .line 31
    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 33
    .line 34
    .line 35
    check-cast v3, Landroidx/preference/PreferenceScreen;

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Landroidx/preference/Preference;->j(Lju0;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, v0, Lju0;->d:Landroid/content/SharedPreferences$Editor;

    .line 41
    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 45
    .line 46
    .line 47
    :cond_0
    const/4 v1, 0x0

    .line 48
    iput-boolean v1, v0, Lju0;->e:Z

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {v3, p1}, Landroidx/preference/PreferenceGroup;->z(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    instance-of v0, v3, Landroidx/preference/PreferenceScreen;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const-string p0, "Preference object with key "

    .line 62
    .line 63
    const-string v0, " is not a PreferenceScreen"

    .line 64
    .line 65
    invoke-static {p0, p1, v0}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    :goto_0
    check-cast v3, Landroidx/preference/PreferenceScreen;

    .line 74
    .line 75
    iget-object p1, p0, Lcu0;->e0:Lju0;

    .line 76
    .line 77
    iget-object v0, p1, Lju0;->g:Landroidx/preference/PreferenceScreen;

    .line 78
    .line 79
    if-eq v3, v0, :cond_5

    .line 80
    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    invoke-virtual {v0}, Landroidx/preference/PreferenceGroup;->m()V

    .line 84
    .line 85
    .line 86
    :cond_3
    iput-object v3, p1, Lju0;->g:Landroidx/preference/PreferenceScreen;

    .line 87
    .line 88
    iput-boolean v2, p0, Lcu0;->g0:Z

    .line 89
    .line 90
    iget-boolean p1, p0, Lcu0;->h0:Z

    .line 91
    .line 92
    if-eqz p1, :cond_5

    .line 93
    .line 94
    iget-object p1, p0, Lcu0;->j0:Lc4;

    .line 95
    .line 96
    invoke-virtual {p1, v2}, Landroid/os/Handler;->hasMessages(I)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    invoke-virtual {p1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 108
    .line 109
    .line 110
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lh70;->H()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 119
    .line 120
    const/4 v0, 0x2

    .line 121
    and-int/2addr p1, v0

    .line 122
    const/4 v3, 0x0

    .line 123
    if-eqz p1, :cond_6

    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_6
    const-string p1, "PrioritizeLocalAssets"

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    if-eqz p1, :cond_a

    .line 133
    .line 134
    iget-object v4, p1, Landroidx/preference/Preference;->Q:Landroidx/preference/PreferenceGroup;

    .line 135
    .line 136
    if-eqz v4, :cond_a

    .line 137
    .line 138
    monitor-enter v4

    .line 139
    :try_start_1
    invoke-virtual {p1}, Landroidx/preference/Preference;->x()V

    .line 140
    .line 141
    .line 142
    iget-object v5, p1, Landroidx/preference/Preference;->Q:Landroidx/preference/PreferenceGroup;

    .line 143
    .line 144
    if-ne v5, v4, :cond_7

    .line 145
    .line 146
    iput-object v3, p1, Landroidx/preference/Preference;->Q:Landroidx/preference/PreferenceGroup;

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :catchall_0
    move-exception p0

    .line 150
    goto :goto_3

    .line 151
    :cond_7
    :goto_2
    iget-object v5, v4, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v5

    .line 157
    if-eqz v5, :cond_9

    .line 158
    .line 159
    iget-object v5, p1, Landroidx/preference/Preference;->t:Ljava/lang/String;

    .line 160
    .line 161
    if-eqz v5, :cond_8

    .line 162
    .line 163
    iget-object v6, v4, Landroidx/preference/PreferenceGroup;->V:Lu71;

    .line 164
    .line 165
    invoke-virtual {p1}, Landroidx/preference/Preference;->c()J

    .line 166
    .line 167
    .line 168
    move-result-wide v7

    .line 169
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    invoke-virtual {v6, v5, v7}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    iget-object v5, v4, Landroidx/preference/PreferenceGroup;->W:Landroid/os/Handler;

    .line 177
    .line 178
    iget-object v6, v4, Landroidx/preference/PreferenceGroup;->c0:Ldu0;

    .line 179
    .line 180
    invoke-virtual {v5, v6}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 181
    .line 182
    .line 183
    iget-object v5, v4, Landroidx/preference/PreferenceGroup;->W:Landroid/os/Handler;

    .line 184
    .line 185
    iget-object v6, v4, Landroidx/preference/PreferenceGroup;->c0:Ldu0;

    .line 186
    .line 187
    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 188
    .line 189
    .line 190
    :cond_8
    iget-boolean v5, v4, Landroidx/preference/PreferenceGroup;->a0:Z

    .line 191
    .line 192
    if-eqz v5, :cond_9

    .line 193
    .line 194
    invoke-virtual {p1}, Landroidx/preference/Preference;->m()V

    .line 195
    .line 196
    .line 197
    :cond_9
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    iget-object p1, v4, Landroidx/preference/Preference;->O:Lhu0;

    .line 199
    .line 200
    if-eqz p1, :cond_a

    .line 201
    .line 202
    iget-object v4, p1, Lhu0;->g:Landroid/os/Handler;

    .line 203
    .line 204
    iget-object p1, p1, Lhu0;->h:Lfu0;

    .line 205
    .line 206
    invoke-virtual {v4, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v4, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 210
    .line 211
    .line 212
    goto :goto_4

    .line 213
    :goto_3
    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 214
    throw p0

    .line 215
    :cond_a
    :goto_4
    new-instance p1, Ljava/util/ArrayList;

    .line 216
    .line 217
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .line 219
    .line 220
    sget v4, Lcom/melodix/music/AppSingleton;->j:I

    .line 221
    .line 222
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    const-string v5, "ActiveSettingsCategory"

    .line 227
    .line 228
    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v4

    .line 232
    iget-object v5, p0, Lcu0;->e0:Lju0;

    .line 233
    .line 234
    iget-object v5, v5, Lju0;->g:Landroidx/preference/PreferenceScreen;

    .line 235
    .line 236
    iget-object v5, v5, Landroidx/preference/PreferenceGroup;->X:Ljava/util/ArrayList;

    .line 237
    .line 238
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 239
    .line 240
    .line 241
    move-result v5

    .line 242
    move v6, v1

    .line 243
    :goto_5
    if-ge v6, v5, :cond_d

    .line 244
    .line 245
    iget-object v7, p0, Lcu0;->e0:Lju0;

    .line 246
    .line 247
    iget-object v7, v7, Lju0;->g:Landroidx/preference/PreferenceScreen;

    .line 248
    .line 249
    invoke-virtual {v7, v6}, Landroidx/preference/PreferenceGroup;->A(I)Landroidx/preference/Preference;

    .line 250
    .line 251
    .line 252
    move-result-object v7

    .line 253
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    .line 255
    .line 256
    instance-of v8, v7, Lcom/melodix/music/ExpandablePreferenceCategory;

    .line 257
    .line 258
    if-eqz v8, :cond_c

    .line 259
    .line 260
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    if-eqz v4, :cond_c

    .line 264
    .line 265
    check-cast v7, Lcom/melodix/music/ExpandablePreferenceCategory;

    .line 266
    .line 267
    iget-object v8, v7, Landroidx/preference/Preference;->p:Ljava/lang/CharSequence;

    .line 268
    .line 269
    if-eqz v8, :cond_b

    .line 270
    .line 271
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v8

    .line 275
    goto :goto_6

    .line 276
    :cond_b
    move-object v8, v3

    .line 277
    :goto_6
    invoke-static {v8, v4}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v8

    .line 281
    if-eqz v8, :cond_c

    .line 282
    .line 283
    invoke-virtual {v7, v2}, Lcom/melodix/music/ExpandablePreferenceCategory;->B(Z)V

    .line 284
    .line 285
    .line 286
    :cond_c
    add-int/lit8 v6, v6, 0x1

    .line 287
    .line 288
    goto :goto_5

    .line 289
    :cond_d
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 290
    .line 291
    .line 292
    move-result v3

    .line 293
    move v4, v1

    .line 294
    :goto_7
    if-ge v4, v3, :cond_e

    .line 295
    .line 296
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v5

    .line 300
    add-int/lit8 v4, v4, 0x1

    .line 301
    .line 302
    check-cast v5, Lcom/melodix/music/ExpandablePreferenceCategory;

    .line 303
    .line 304
    new-instance v6, Ll21;

    .line 305
    .line 306
    invoke-direct {v6, v2, p1}, Ll21;-><init>(ILjava/lang/Object;)V

    .line 307
    .line 308
    .line 309
    iput-object v6, v5, Lcom/melodix/music/ExpandablePreferenceCategory;->e0:Ll21;

    .line 310
    .line 311
    goto :goto_7

    .line 312
    :cond_e
    const-string p1, "ClearCache"

    .line 313
    .line 314
    invoke-virtual {p0, p1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    if-eqz p1, :cond_f

    .line 319
    .line 320
    new-instance v3, Lx51;

    .line 321
    .line 322
    invoke-direct {v3, p0, v1}, Lx51;-><init>(Lcom/melodix/music/SettingsActivity$a;I)V

    .line 323
    .line 324
    .line 325
    iput-object v3, p1, Landroidx/preference/Preference;->n:Ltt0;

    .line 326
    .line 327
    :cond_f
    const-string p1, "CustomCss"

    .line 328
    .line 329
    invoke-virtual {p0, p1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    invoke-static {p1}, Lcom/melodix/music/SettingsActivity$a;->S(Landroidx/preference/Preference;)V

    .line 334
    .line 335
    .line 336
    if-eqz p1, :cond_10

    .line 337
    .line 338
    new-instance v3, Le61;

    .line 339
    .line 340
    invoke-direct {v3, p0, p1, v1}, Le61;-><init>(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V

    .line 341
    .line 342
    .line 343
    iput-object v3, p1, Landroidx/preference/Preference;->n:Ltt0;

    .line 344
    .line 345
    :cond_10
    const-string p1, "ActiveAccountBadge"

    .line 346
    .line 347
    invoke-virtual {p0, p1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    const-string v1, "SwitchAccount"

    .line 352
    .line 353
    invoke-virtual {p0, v1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    const-string v3, "SaveCurrentAccount"

    .line 358
    .line 359
    invoke-virtual {p0, v3}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    const-string v4, "ManageAccounts"

    .line 364
    .line 365
    invoke-virtual {p0, v4}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 366
    .line 367
    .line 368
    move-result-object v4

    .line 369
    invoke-static {p0, p1}, Lcom/melodix/music/SettingsActivity$a;->R(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 370
    .line 371
    .line 372
    if-eqz v3, :cond_11

    .line 373
    .line 374
    new-instance v5, Le61;

    .line 375
    .line 376
    invoke-direct {v5, p0, p1, v2}, Le61;-><init>(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V

    .line 377
    .line 378
    .line 379
    iput-object v5, v3, Landroidx/preference/Preference;->n:Ltt0;

    .line 380
    .line 381
    :cond_11
    if-eqz v1, :cond_12

    .line 382
    .line 383
    new-instance v3, Le61;

    .line 384
    .line 385
    invoke-direct {v3, p0, p1, v0}, Le61;-><init>(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V

    .line 386
    .line 387
    .line 388
    iput-object v3, v1, Landroidx/preference/Preference;->n:Ltt0;

    .line 389
    .line 390
    :cond_12
    if-eqz v4, :cond_13

    .line 391
    .line 392
    new-instance v1, Le61;

    .line 393
    .line 394
    const/4 v3, 0x3

    .line 395
    invoke-direct {v1, p0, p1, v3}, Le61;-><init>(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V

    .line 396
    .line 397
    .line 398
    iput-object v1, v4, Landroidx/preference/Preference;->n:Ltt0;

    .line 399
    .line 400
    :cond_13
    const-string p1, "AdBlockMode"

    .line 401
    .line 402
    invoke-virtual {p0, p1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 403
    .line 404
    .line 405
    move-result-object p1

    .line 406
    sget v1, Lcom/melodix/music/AppSingleton;->j:I

    .line 407
    .line 408
    invoke-static {}, Lm9;->e()Landroid/content/SharedPreferences;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    const-string v3, "AdBlockMode"

    .line 413
    .line 414
    const-string v4, "legacy"

    .line 415
    .line 416
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    invoke-static {p0, p1, v1}, Lcom/melodix/music/SettingsActivity$a;->T(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    if-eqz p1, :cond_14

    .line 424
    .line 425
    new-instance v1, Le61;

    .line 426
    .line 427
    const/4 v3, 0x4

    .line 428
    invoke-direct {v1, p0, p1, v3}, Le61;-><init>(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V

    .line 429
    .line 430
    .line 431
    iput-object v1, p1, Landroidx/preference/Preference;->n:Ltt0;

    .line 432
    .line 433
    :cond_14
    const-string p1, "AndAuto"

    .line 434
    .line 435
    invoke-virtual {p0, p1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    if-eqz p1, :cond_15

    .line 440
    .line 441
    new-instance v1, Lx51;

    .line 442
    .line 443
    invoke-direct {v1, p0, v2}, Lx51;-><init>(Lcom/melodix/music/SettingsActivity$a;I)V

    .line 444
    .line 445
    .line 446
    iput-object v1, p1, Landroidx/preference/Preference;->n:Ltt0;

    .line 447
    .line 448
    :cond_15
    const-string p1, "ClearData"

    .line 449
    .line 450
    invoke-virtual {p0, p1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 451
    .line 452
    .line 453
    move-result-object p1

    .line 454
    if-eqz p1, :cond_16

    .line 455
    .line 456
    new-instance v1, Lx51;

    .line 457
    .line 458
    invoke-direct {v1, p0, v0}, Lx51;-><init>(Lcom/melodix/music/SettingsActivity$a;I)V

    .line 459
    .line 460
    .line 461
    iput-object v1, p1, Landroidx/preference/Preference;->n:Ltt0;

    .line 462
    .line 463
    :cond_16
    const-string p1, "ProxySettings"

    .line 464
    .line 465
    invoke-virtual {p0, p1}, Lcu0;->M(Ljava/lang/String;)Landroidx/preference/Preference;

    .line 466
    .line 467
    .line 468
    move-result-object p1

    .line 469
    if-eqz p1, :cond_17

    .line 470
    .line 471
    invoke-static {}, Lcom/melodix/music/SettingsActivity$a;->O()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->u(Ljava/lang/CharSequence;)V

    .line 476
    .line 477
    .line 478
    :cond_17
    if-eqz p1, :cond_18

    .line 479
    .line 480
    new-instance v0, Le61;

    .line 481
    .line 482
    const/4 v1, 0x5

    .line 483
    invoke-direct {v0, p0, p1, v1}, Le61;-><init>(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V

    .line 484
    .line 485
    .line 486
    iput-object v0, p1, Landroidx/preference/Preference;->n:Ltt0;

    .line 487
    .line 488
    :cond_18
    return-void

    .line 489
    :catchall_1
    move-exception p0

    .line 490
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 491
    .line 492
    .line 493
    throw p0

    .line 494
    :cond_19
    new-instance p0, Ljava/lang/RuntimeException;

    .line 495
    .line 496
    const-string p1, "This should be called after super.onCreate."

    .line 497
    .line 498
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    throw p0
.end method
