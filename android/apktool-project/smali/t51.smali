.class public final synthetic Lt51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Le2;

.field public final synthetic m:I

.field public final synthetic n:Lhz0;

.field public final synthetic o:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic p:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;ILe2;Lhz0;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lt51;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lt51;->k:Landroid/content/Context;

    .line 8
    .line 9
    iput p2, p0, Lt51;->m:I

    .line 10
    .line 11
    iput-object p3, p0, Lt51;->l:Le2;

    .line 12
    .line 13
    iput-object p4, p0, Lt51;->n:Lhz0;

    .line 14
    .line 15
    iput-object p5, p0, Lt51;->o:Lcom/melodix/music/SettingsActivity$a;

    .line 16
    .line 17
    iput-object p6, p0, Lt51;->p:Landroidx/preference/Preference;

    .line 18
    .line 19
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Le2;ILhz0;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V
    .locals 1

    .line 20
    const/4 v0, 0x1

    iput v0, p0, Lt51;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt51;->k:Landroid/content/Context;

    iput-object p2, p0, Lt51;->l:Le2;

    iput p3, p0, Lt51;->m:I

    iput-object p4, p0, Lt51;->n:Lhz0;

    iput-object p5, p0, Lt51;->o:Lcom/melodix/music/SettingsActivity$a;

    iput-object p6, p0, Lt51;->p:Landroidx/preference/Preference;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 13

    .line 1
    iget p1, p0, Lt51;->j:I

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    const/4 v1, -0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "Cancel"

    .line 7
    .line 8
    iget v4, p0, Lt51;->m:I

    .line 9
    .line 10
    packed-switch p1, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    new-instance p1, Lf4;

    .line 14
    .line 15
    iget-object v6, p0, Lt51;->k:Landroid/content/Context;

    .line 16
    .line 17
    invoke-direct {p1, v6}, Lf4;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iget-object v5, p1, Lf4;->c:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v5, Lb4;

    .line 23
    .line 24
    const-string v7, "Delete Profile"

    .line 25
    .line 26
    iput-object v7, v5, Lb4;->d:Ljava/lang/CharSequence;

    .line 27
    .line 28
    iget-object v7, p0, Lt51;->l:Le2;

    .line 29
    .line 30
    iget-object v8, v7, Le2;->b:Ljava/lang/String;

    .line 31
    .line 32
    const-string v9, "Delete saved profile \'"

    .line 33
    .line 34
    const-string v10, "\'?"

    .line 35
    .line 36
    invoke-static {v9, v8, v10}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v8

    .line 40
    iput-object v8, v5, Lb4;->f:Ljava/lang/CharSequence;

    .line 41
    .line 42
    new-instance v5, La61;

    .line 43
    .line 44
    const/4 v11, 0x1

    .line 45
    iget-object v8, p0, Lt51;->n:Lhz0;

    .line 46
    .line 47
    iget-object v9, p0, Lt51;->o:Lcom/melodix/music/SettingsActivity$a;

    .line 48
    .line 49
    iget-object v10, p0, Lt51;->p:Landroidx/preference/Preference;

    .line 50
    .line 51
    invoke-direct/range {v5 .. v11}, La61;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V

    .line 52
    .line 53
    .line 54
    const-string p0, "Delete"

    .line 55
    .line 56
    invoke-virtual {p1, p0, v5}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v3, v2}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lf4;->a()Lg4;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v1}, Lg4;->d(I)Landroid/widget/Button;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    const-string v1, "#E91E63"

    .line 76
    .line 77
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    .line 83
    .line 84
    :cond_0
    invoke-virtual {p0, v0}, Lg4;->d(I)Landroid/widget/Button;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    if-eqz p0, :cond_1

    .line 89
    .line 90
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    .line 92
    .line 93
    :cond_1
    return-void

    .line 94
    :pswitch_0
    new-instance p1, Landroid/widget/LinearLayout;

    .line 95
    .line 96
    iget-object v6, p0, Lt51;->k:Landroid/content/Context;

    .line 97
    .line 98
    invoke-direct {p1, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 99
    .line 100
    .line 101
    const/4 v5, 0x1

    .line 102
    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 103
    .line 104
    .line 105
    const/16 v5, 0x10

    .line 106
    .line 107
    const/16 v7, 0x30

    .line 108
    .line 109
    const/16 v8, 0x18

    .line 110
    .line 111
    invoke-virtual {p1, v7, v8, v7, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 112
    .line 113
    .line 114
    move v5, v8

    .line 115
    new-instance v8, Landroid/widget/EditText;

    .line 116
    .line 117
    invoke-direct {v8, v6}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 118
    .line 119
    .line 120
    iget-object v7, p0, Lt51;->l:Le2;

    .line 121
    .line 122
    iget-object v9, v7, Le2;->b:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 128
    .line 129
    .line 130
    const/high16 v9, 0x41700000    # 15.0f

    .line 131
    .line 132
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 133
    .line 134
    .line 135
    new-instance v9, Landroid/graphics/drawable/GradientDrawable;

    .line 136
    .line 137
    invoke-direct {v9}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 138
    .line 139
    .line 140
    const-string v10, "#282828"

    .line 141
    .line 142
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v10

    .line 146
    invoke-virtual {v9, v10}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 147
    .line 148
    .line 149
    const/high16 v10, 0x41800000    # 16.0f

    .line 150
    .line 151
    invoke-virtual {v9, v10}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v8, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 155
    .line 156
    .line 157
    const/16 v9, 0x20

    .line 158
    .line 159
    invoke-virtual {v8, v9, v5, v9, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 163
    .line 164
    .line 165
    new-instance v12, Lf4;

    .line 166
    .line 167
    invoke-direct {v12, v6}, Lf4;-><init>(Landroid/content/Context;)V

    .line 168
    .line 169
    .line 170
    iget-object v5, v12, Lf4;->c:Ljava/lang/Object;

    .line 171
    .line 172
    check-cast v5, Lb4;

    .line 173
    .line 174
    const-string v9, "Rename Profile"

    .line 175
    .line 176
    iput-object v9, v5, Lb4;->d:Ljava/lang/CharSequence;

    .line 177
    .line 178
    iput-object p1, v5, Lb4;->r:Landroid/view/View;

    .line 179
    .line 180
    new-instance v5, Lg61;

    .line 181
    .line 182
    iget-object v9, p0, Lt51;->n:Lhz0;

    .line 183
    .line 184
    iget-object v10, p0, Lt51;->o:Lcom/melodix/music/SettingsActivity$a;

    .line 185
    .line 186
    iget-object v11, p0, Lt51;->p:Landroidx/preference/Preference;

    .line 187
    .line 188
    invoke-direct/range {v5 .. v11}, Lg61;-><init>(Landroid/content/Context;Le2;Landroid/widget/EditText;Lhz0;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 189
    .line 190
    .line 191
    const-string p0, "Save"

    .line 192
    .line 193
    invoke-virtual {v12, p0, v5}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v12, v3, v2}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v12}, Lf4;->a()Lg4;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0, v1}, Lg4;->d(I)Landroid/widget/Button;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    if-eqz p1, :cond_2

    .line 211
    .line 212
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    .line 214
    .line 215
    :cond_2
    invoke-virtual {p0, v0}, Lg4;->d(I)Landroid/widget/Button;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    if-eqz p0, :cond_3

    .line 220
    .line 221
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 222
    .line 223
    .line 224
    :cond_3
    return-void

    .line 225
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
