.class public final synthetic Lw51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/io/Serializable;

.field public final synthetic m:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p4, p0, Lw51;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lw51;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p2, p0, Lw51;->l:Ljava/io/Serializable;

    .line 6
    .line 7
    iput-object p3, p0, Lw51;->m:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Ljava/io/Serializable;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 13
    iput p4, p0, Lw51;->j:I

    iput-object p1, p0, Lw51;->l:Ljava/io/Serializable;

    iput-object p2, p0, Lw51;->k:Ljava/lang/Object;

    iput-object p3, p0, Lw51;->m:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 9

    .line 1
    iget p1, p0, Lw51;->j:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iget-object v1, p0, Lw51;->m:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object v2, p0, Lw51;->k:Ljava/lang/Object;

    .line 7
    .line 8
    iget-object p0, p0, Lw51;->l:Ljava/io/Serializable;

    .line 9
    .line 10
    packed-switch p1, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    check-cast p0, Ljava/util/ArrayList;

    .line 14
    .line 15
    check-cast v2, Ljava/util/List;

    .line 16
    .line 17
    check-cast v1, Ljava/util/List;

    .line 18
    .line 19
    const-string v7, "REPEAT"

    .line 20
    .line 21
    const-string v8, "SHUFFLE"

    .line 22
    .line 23
    const-string v3, "PLAY"

    .line 24
    .line 25
    const-string v4, "PREV"

    .line 26
    .line 27
    const-string v5, "NEXT"

    .line 28
    .line 29
    const-string v6, "FAV"

    .line 30
    .line 31
    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_0
    const/4 v3, 0x6

    .line 40
    if-ge v0, v3, :cond_0

    .line 41
    .line 42
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-interface {p0, v0, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-static {v2, p0, v1}, Lcom/melodix/music/SettingsActivity$a;->U(Ljava/util/List;Ljava/util/ArrayList;Ljava/util/List;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :pswitch_0
    check-cast v2, Landroid/content/Context;

    .line 57
    .line 58
    check-cast p0, Ljava/util/ArrayList;

    .line 59
    .line 60
    check-cast v1, Lcom/melodix/music/SettingsActivity$a;

    .line 61
    .line 62
    invoke-static {p0}, Lcom/melodix/music/SettingsActivity$a;->Q(Ljava/util/ArrayList;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    const-string p0, "URL list cannot be empty"

    .line 73
    .line 74
    invoke-static {v2, p0, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    sget p1, Lcom/melodix/music/AppSingleton;->j:I

    .line 83
    .line 84
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const-string v3, "AdBlockListUrl"

    .line 89
    .line 90
    invoke-interface {p1, v3, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 95
    .line 96
    .line 97
    sput-object p0, Lcom/melodix/music/AppSingleton;->a0:Ljava/lang/String;

    .line 98
    .line 99
    const-string p0, "Updating blocklists..."

    .line 100
    .line 101
    invoke-static {v2, p0, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 106
    .line 107
    .line 108
    new-instance p0, Lib0;

    .line 109
    .line 110
    const/4 p1, 0x1

    .line 111
    invoke-direct {p0, v1, p1, v2}, Lib0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    new-instance v0, Ljava/lang/Thread;

    .line 115
    .line 116
    new-instance v1, Lo6;

    .line 117
    .line 118
    invoke-direct {v1, p0, p1, v2}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 125
    .line 126
    .line 127
    :goto_1
    return-void

    .line 128
    :pswitch_1
    check-cast v2, Landroid/content/Context;

    .line 129
    .line 130
    check-cast p0, Ljava/util/ArrayList;

    .line 131
    .line 132
    check-cast v1, Landroid/widget/LinearLayout;

    .line 133
    .line 134
    const-string p1, ""

    .line 135
    .line 136
    invoke-static {v2, p0, v1, p1}, Lcom/melodix/music/SettingsActivity$a;->P(Landroid/content/Context;Ljava/util/ArrayList;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :pswitch_2
    check-cast p0, Lhz0;

    .line 141
    .line 142
    check-cast v2, Landroid/content/Context;

    .line 143
    .line 144
    check-cast v1, Lcom/melodix/music/SettingsActivity$a;

    .line 145
    .line 146
    iget-object p0, p0, Lhz0;->j:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast p0, Lg4;

    .line 149
    .line 150
    if-eqz p0, :cond_2

    .line 151
    .line 152
    invoke-virtual {p0}, Lg4;->dismiss()V

    .line 153
    .line 154
    .line 155
    :cond_2
    sget p0, Lcom/melodix/music/AppSingleton;->j:I

    .line 156
    .line 157
    invoke-static {v2}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    if-eqz p0, :cond_3

    .line 162
    .line 163
    invoke-virtual {v1}, Lh70;->g()Le6;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    if-eqz p1, :cond_3

    .line 168
    .line 169
    invoke-virtual {v1}, Lh70;->G()Le6;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    new-instance v0, Lzg0;

    .line 174
    .line 175
    const/4 v3, 0x2

    .line 176
    invoke-direct {v0, v1, v3, v2}, Lzg0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    const/4 v1, 0x0

    .line 180
    invoke-static {p1, v1}, Lbh;->C(Landroid/content/Context;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    new-instance v1, Lb2;

    .line 188
    .line 189
    invoke-direct {v1, p1, p0, v0}, Lb2;-><init>(Landroid/webkit/CookieManager;Landroid/webkit/WebView;Lzg0;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p1, v1}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V

    .line 193
    .line 194
    .line 195
    :cond_3
    return-void

    .line 196
    nop

    .line 197
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
