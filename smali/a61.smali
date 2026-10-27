.class public final synthetic La61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic l:Landroidx/preference/Preference;

.field public final synthetic m:Ljava/lang/Object;

.field public final synthetic n:Ljava/lang/Object;

.field public final synthetic o:Ljava/io/Serializable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V
    .locals 0

    .line 1
    iput p6, p0, La61;->j:I

    .line 2
    .line 3
    iput-object p1, p0, La61;->m:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p2, p0, La61;->n:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p3, p0, La61;->o:Ljava/io/Serializable;

    .line 8
    .line 9
    iput-object p4, p0, La61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 10
    .line 11
    iput-object p5, p0, La61;->l:Landroidx/preference/Preference;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 1
    iget p1, p0, La61;->j:I

    .line 2
    .line 3
    iget-object p2, p0, La61;->l:Landroidx/preference/Preference;

    .line 4
    .line 5
    iget-object v0, p0, La61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 6
    .line 7
    iget-object v1, p0, La61;->o:Ljava/io/Serializable;

    .line 8
    .line 9
    iget-object v2, p0, La61;->n:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p0, p0, La61;->m:Ljava/lang/Object;

    .line 12
    .line 13
    packed-switch p1, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    check-cast p0, Landroid/content/Context;

    .line 17
    .line 18
    check-cast v2, Le2;

    .line 19
    .line 20
    check-cast v1, Lhz0;

    .line 21
    .line 22
    iget-object p1, v2, Le2;->a:Ljava/lang/String;

    .line 23
    .line 24
    const-string v2, ".json"

    .line 25
    .line 26
    :try_start_0
    new-instance v3, Ljava/io/File;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    const-string v5, "account_profiles"

    .line 33
    .line 34
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-nez v4, :cond_0

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 44
    .line 45
    .line 46
    :cond_0
    new-instance v4, Ljava/io/File;

    .line 47
    .line 48
    invoke-virtual {p1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-direct {v4, v3, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-static {p0}, Lbh;->o(Landroid/content/Context;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {v2, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    invoke-static {p0, p1}, Lbh;->C(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    :catch_0
    :cond_2
    invoke-static {v0, p2}, Lcom/melodix/music/SettingsActivity$a;->R(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 79
    .line 80
    .line 81
    const-string p1, "Profile deleted"

    .line 82
    .line 83
    const/4 p2, 0x0

    .line 84
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 89
    .line 90
    .line 91
    iget-object p0, v1, Lhz0;->j:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast p0, Lg4;

    .line 94
    .line 95
    if-eqz p0, :cond_3

    .line 96
    .line 97
    invoke-virtual {p0}, Lg4;->dismiss()V

    .line 98
    .line 99
    .line 100
    :cond_3
    return-void

    .line 101
    :pswitch_0
    check-cast p0, Landroid/widget/Spinner;

    .line 102
    .line 103
    check-cast v2, [Ljava/lang/String;

    .line 104
    .line 105
    check-cast v1, Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getSelectedItemPosition()I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    invoke-static {p0, v2}, Lia;->Q(I[Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    check-cast p0, Ljava/lang/String;

    .line 116
    .line 117
    if-nez p0, :cond_4

    .line 118
    .line 119
    const-string p0, "legacy"

    .line 120
    .line 121
    :cond_4
    invoke-static {v1}, Lcom/melodix/music/SettingsActivity$a;->Q(Ljava/util/ArrayList;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    sget v1, Lcom/melodix/music/AppSingleton;->j:I

    .line 126
    .line 127
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    const-string v2, "AdBlockMode"

    .line 132
    .line 133
    invoke-interface {v1, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 138
    .line 139
    .line 140
    sput-object p0, Lcom/melodix/music/AppSingleton;->X:Ljava/lang/String;

    .line 141
    .line 142
    const-string v1, "dynamic"

    .line 143
    .line 144
    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-eqz v1, :cond_6

    .line 149
    .line 150
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-lez v1, :cond_5

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_5
    const-string p1, "https://raw.githubusercontent.com/Souxch06/Melodix/main/Melodix-v1.2.2-3d2c473/assets/adblock_hosts.txt"

    .line 158
    .line 159
    :goto_0
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    const-string v2, "AdBlockListUrl"

    .line 164
    .line 165
    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 170
    .line 171
    .line 172
    sput-object p1, Lcom/melodix/music/AppSingleton;->a0:Ljava/lang/String;

    .line 173
    .line 174
    :cond_6
    invoke-static {v0, p2, p0}, Lcom/melodix/music/SettingsActivity$a;->T(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    const/4 p0, 0x1

    .line 178
    sput-boolean p0, Lcom/melodix/music/MainActivity;->k0:Z

    .line 179
    .line 180
    return-void

    .line 181
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
