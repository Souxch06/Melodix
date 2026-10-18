.class public final synthetic Lx51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ltt0;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/SettingsActivity$a;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/SettingsActivity$a;I)V
    .locals 0

    .line 1
    iput p2, p0, Lx51;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lx51;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(Landroidx/preference/Preference;)V
    .locals 5

    .line 1
    iget p1, p0, Lx51;->j:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    iget-object p0, p0, Lx51;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 6
    .line 7
    packed-switch p1, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    new-instance p1, Lf4;

    .line 11
    .line 12
    invoke-virtual {p0}, Lh70;->H()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p1, v0}, Lf4;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lf4;->c:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Lb4;

    .line 22
    .line 23
    iget-object v2, v0, Lb4;->a:Landroid/view/ContextThemeWrapper;

    .line 24
    .line 25
    const v3, 0x7f11004c

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iput-object v2, v0, Lb4;->d:Ljava/lang/CharSequence;

    .line 33
    .line 34
    iget-object v2, v0, Lb4;->a:Landroid/view/ContextThemeWrapper;

    .line 35
    .line 36
    const v3, 0x7f11004b

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iput-object v3, v0, Lb4;->f:Ljava/lang/CharSequence;

    .line 44
    .line 45
    const v3, 0x7f11004a

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iput-object v3, v0, Lb4;->i:Ljava/lang/CharSequence;

    .line 53
    .line 54
    iput-object v1, v0, Lb4;->j:Landroid/content/DialogInterface$OnClickListener;

    .line 55
    .line 56
    new-instance v1, Ly51;

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-direct {v1, v3, p0}, Ly51;-><init>(ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    const p0, 0x7f11004d

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iput-object p0, v0, Lb4;->g:Ljava/lang/CharSequence;

    .line 70
    .line 71
    iput-object v1, v0, Lb4;->h:Landroid/content/DialogInterface$OnClickListener;

    .line 72
    .line 73
    invoke-virtual {p1}, Lf4;->g()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :pswitch_0
    invoke-virtual {p0}, Lh70;->G()Le6;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    const v3, 0x7f0c0031

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const v2, 0x7f0901dd

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Landroidx/appcompat/widget/SwitchCompat;

    .line 100
    .line 101
    const v3, 0x7f090075

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    sget-boolean v4, Lcom/melodix/music/AppSingleton;->F:Z

    .line 109
    .line 110
    invoke-virtual {v2, v4}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 111
    .line 112
    .line 113
    sget-boolean v4, Lcom/melodix/music/AppSingleton;->F:Z

    .line 114
    .line 115
    if-eqz v4, :cond_0

    .line 116
    .line 117
    const/high16 v4, 0x3f800000    # 1.0f

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_0
    const v4, 0x3ecccccd    # 0.4f

    .line 121
    .line 122
    .line 123
    :goto_0
    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 124
    .line 125
    .line 126
    sget-boolean v4, Lcom/melodix/music/AppSingleton;->F:Z

    .line 127
    .line 128
    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 129
    .line 130
    .line 131
    new-instance v4, Ls51;

    .line 132
    .line 133
    invoke-direct {v4, v3}, Ls51;-><init>(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2, v4}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 137
    .line 138
    .line 139
    new-instance v2, Lf4;

    .line 140
    .line 141
    invoke-direct {v2, p1}, Lf4;-><init>(Landroid/content/Context;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, v2, Lf4;->c:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast p1, Lb4;

    .line 147
    .line 148
    iput-object v1, p1, Lb4;->r:Landroid/view/View;

    .line 149
    .line 150
    invoke-virtual {v2}, Lf4;->a()Lg4;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    new-instance v2, Lgt;

    .line 155
    .line 156
    invoke-direct {v2, v0, p0}, Lgt;-><init>(ILjava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    .line 161
    .line 162
    const p0, 0x7f09005d

    .line 163
    .line 164
    .line 165
    invoke-virtual {v1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    check-cast p0, Landroid/widget/Button;

    .line 170
    .line 171
    new-instance v0, Lgt;

    .line 172
    .line 173
    const/4 v1, 0x2

    .line 174
    invoke-direct {v0, v1, p1}, Lgt;-><init>(ILjava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :pswitch_1
    sput-boolean v0, Lcom/melodix/music/MainActivity;->k0:Z

    .line 185
    .line 186
    invoke-virtual {p0}, Lh70;->g()Le6;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    if-eqz p0, :cond_1

    .line 191
    .line 192
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 193
    .line 194
    .line 195
    :cond_1
    return-void

    .line 196
    nop

    .line 197
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
