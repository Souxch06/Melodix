.class public final synthetic Lz51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:[Ljava/lang/String;

.field public final synthetic k:Landroid/widget/Spinner;

.field public final synthetic l:Landroid/widget/EditText;

.field public final synthetic m:Landroid/widget/EditText;

.field public final synthetic n:Landroid/content/Context;

.field public final synthetic o:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic p:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/String;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz51;->j:[Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lz51;->k:Landroid/widget/Spinner;

    .line 7
    .line 8
    iput-object p3, p0, Lz51;->l:Landroid/widget/EditText;

    .line 9
    .line 10
    iput-object p4, p0, Lz51;->m:Landroid/widget/EditText;

    .line 11
    .line 12
    iput-object p5, p0, Lz51;->n:Landroid/content/Context;

    .line 13
    .line 14
    iput-object p6, p0, Lz51;->o:Lcom/melodix/music/SettingsActivity$a;

    .line 15
    .line 16
    iput-object p7, p0, Lz51;->p:Landroidx/preference/Preference;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 8

    .line 1
    iget-object p1, p0, Lz51;->k:Landroid/widget/Spinner;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getSelectedItemPosition()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p2, p0, Lz51;->j:[Ljava/lang/String;

    .line 8
    .line 9
    aget-object p1, p2, p1

    .line 10
    .line 11
    iget-object p2, p0, Lz51;->l:Landroid/widget/EditText;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iget-object v0, p0, Lz51;->m:Landroid/widget/EditText;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lka1;->r(Ljava/lang/String;)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v1, 0x0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    move v0, v1

    .line 60
    :goto_0
    const-string v2, "none"

    .line 61
    .line 62
    invoke-static {p1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    iget-object v4, p0, Lz51;->n:Landroid/content/Context;

    .line 67
    .line 68
    iget-object v5, p0, Lz51;->o:Lcom/melodix/music/SettingsActivity$a;

    .line 69
    .line 70
    if-nez v3, :cond_3

    .line 71
    .line 72
    invoke-static {p2}, Lda1;->F(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-eqz v3, :cond_1

    .line 77
    .line 78
    const p0, 0x7f110102

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5, p0}, Lh70;->m(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {v4, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_1
    if-lez v0, :cond_2

    .line 94
    .line 95
    const v3, 0xffff

    .line 96
    .line 97
    .line 98
    if-le v0, v3, :cond_3

    .line 99
    .line 100
    :cond_2
    const p0, 0x7f110103

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5, p0}, Lh70;->m(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {v4, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_3
    sget v3, Lcom/melodix/music/AppSingleton;->j:I

    .line 116
    .line 117
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    const-string v6, "ProxyType"

    .line 122
    .line 123
    invoke-interface {v3, v6, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    const-string v6, "ProxyHost"

    .line 128
    .line 129
    invoke-interface {v3, v6, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    const-string v6, "ProxyPort"

    .line 134
    .line 135
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 144
    .line 145
    .line 146
    sput-object p1, Lcom/melodix/music/AppSingleton;->c0:Ljava/lang/String;

    .line 147
    .line 148
    sput-object p2, Lcom/melodix/music/AppSingleton;->d0:Ljava/lang/String;

    .line 149
    .line 150
    sput v0, Lcom/melodix/music/AppSingleton;->e0:I

    .line 151
    .line 152
    sget-object p2, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 153
    .line 154
    if-eqz p2, :cond_4

    .line 155
    .line 156
    invoke-static {p2}, Lm9;->a(Landroid/webkit/WebView;)V

    .line 157
    .line 158
    .line 159
    :cond_4
    invoke-static {}, Lcom/melodix/music/SettingsActivity$a;->O()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    iget-object p0, p0, Lz51;->p:Landroidx/preference/Preference;

    .line 164
    .line 165
    invoke-virtual {p0, p2}, Landroidx/preference/Preference;->u(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    invoke-static {p1, v2}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-eqz p0, :cond_5

    .line 173
    .line 174
    const p0, 0x7f110101

    .line 175
    .line 176
    .line 177
    :goto_1
    invoke-virtual {v5, p0}, Lh70;->m(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    goto :goto_2

    .line 182
    :cond_5
    const p0, 0x7f110105

    .line 183
    .line 184
    .line 185
    goto :goto_1

    .line 186
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 187
    .line 188
    .line 189
    invoke-static {v4, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 194
    .line 195
    .line 196
    return-void
.end method
