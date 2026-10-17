.class public final Llq0;
.super Lvq0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public b:Let0;

.field public c:Landroid/app/PendingIntent;

.field public d:Landroid/app/PendingIntent;

.field public e:Landroid/app/PendingIntent;

.field public f:Z

.field public g:Ljava/lang/Integer;

.field public h:Ljava/lang/Integer;

.field public i:Landroidx/core/graphics/drawable/IconCompat;

.field public j:Ljava/lang/CharSequence;


# virtual methods
.method public final addCompatExtras(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lvq0;->addCompatExtras(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android.callType"

    .line 5
    .line 6
    iget v1, p0, Llq0;->a:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    const-string v0, "android.callIsVideo"

    .line 12
    .line 13
    iget-boolean v1, p0, Llq0;->f:Z

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Llq0;->b:Let0;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v2, 0x1c

    .line 25
    .line 26
    if-lt v1, v2, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ldt0;->b(Let0;)Landroid/app/Person;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Ljq0;->b(Landroid/app/Person;)Landroid/os/Parcelable;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "android.callPerson"

    .line 40
    .line 41
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string v1, "android.callPersonCompat"

    .line 46
    .line 47
    invoke-virtual {v0}, Let0;->b()Landroid/os/Bundle;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    iget-object v0, p0, Llq0;->i:Landroidx/core/graphics/drawable/IconCompat;

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object v1, p0, Lvq0;->mBuilder:Lgq0;

    .line 59
    .line 60
    iget-object v1, v1, Lgq0;->a:Landroid/content/Context;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Lld0;->g(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Liq0;->a(Landroid/graphics/drawable/Icon;)Landroid/os/Parcelable;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v1, "android.verificationIcon"

    .line 74
    .line 75
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    const-string v0, "android.verificationText"

    .line 79
    .line 80
    iget-object v1, p0, Llq0;->j:Ljava/lang/CharSequence;

    .line 81
    .line 82
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    const-string v0, "android.answerIntent"

    .line 86
    .line 87
    iget-object v1, p0, Llq0;->c:Landroid/app/PendingIntent;

    .line 88
    .line 89
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 90
    .line 91
    .line 92
    const-string v0, "android.declineIntent"

    .line 93
    .line 94
    iget-object v1, p0, Llq0;->d:Landroid/app/PendingIntent;

    .line 95
    .line 96
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 97
    .line 98
    .line 99
    const-string v0, "android.hangUpIntent"

    .line 100
    .line 101
    iget-object v1, p0, Llq0;->e:Landroid/app/PendingIntent;

    .line 102
    .line 103
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Llq0;->g:Ljava/lang/Integer;

    .line 107
    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    const-string v1, "android.answerColor"

    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 117
    .line 118
    .line 119
    :cond_3
    iget-object p0, p0, Llq0;->h:Ljava/lang/Integer;

    .line 120
    .line 121
    if-eqz p0, :cond_4

    .line 122
    .line 123
    const-string v0, "android.declineColor"

    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 130
    .line 131
    .line 132
    :cond_4
    return-void
.end method

.method public final apply(Lzp0;)V
    .locals 7

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x3

    .line 8
    const/4 v5, 0x0

    .line 9
    if-lt v0, v1, :cond_8

    .line 10
    .line 11
    iget v0, p0, Llq0;->a:I

    .line 12
    .line 13
    if-eq v0, v3, :cond_2

    .line 14
    .line 15
    if-eq v0, v2, :cond_1

    .line 16
    .line 17
    if-eq v0, v4, :cond_0

    .line 18
    .line 19
    const-string v0, "NotifCompat"

    .line 20
    .line 21
    invoke-static {v0, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    iget v0, p0, Llq0;->a:I

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, Llq0;->b:Let0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Ldt0;->b(Let0;)Landroid/app/Person;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Llq0;->e:Landroid/app/PendingIntent;

    .line 43
    .line 44
    iget-object v2, p0, Llq0;->c:Landroid/app/PendingIntent;

    .line 45
    .line 46
    invoke-static {v0, v1, v2}, Lkq0;->c(Landroid/app/Person;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)Landroid/app/Notification$CallStyle;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v0, p0, Llq0;->b:Let0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    invoke-static {v0}, Ldt0;->b(Let0;)Landroid/app/Person;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Llq0;->e:Landroid/app/PendingIntent;

    .line 61
    .line 62
    invoke-static {v0, v1}, Lkq0;->b(Landroid/app/Person;Landroid/app/PendingIntent;)Landroid/app/Notification$CallStyle;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    iget-object v0, p0, Llq0;->b:Let0;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    invoke-static {v0}, Ldt0;->b(Let0;)Landroid/app/Person;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v1, p0, Llq0;->d:Landroid/app/PendingIntent;

    .line 77
    .line 78
    iget-object v2, p0, Llq0;->c:Landroid/app/PendingIntent;

    .line 79
    .line 80
    invoke-static {v0, v1, v2}, Lkq0;->a(Landroid/app/Person;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)Landroid/app/Notification$CallStyle;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    :cond_3
    :goto_0
    if-eqz v5, :cond_7

    .line 85
    .line 86
    check-cast p1, Ler0;

    .line 87
    .line 88
    iget-object p1, p1, Ler0;->l:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast p1, Landroid/app/Notification$Builder;

    .line 91
    .line 92
    invoke-static {v5, p1}, Lvp;->g(Landroid/app/Notification$CallStyle;Landroid/app/Notification$Builder;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Llq0;->g:Ljava/lang/Integer;

    .line 96
    .line 97
    if-eqz p1, :cond_4

    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    invoke-static {v5, p1}, Lkq0;->d(Landroid/app/Notification$CallStyle;I)Landroid/app/Notification$CallStyle;

    .line 104
    .line 105
    .line 106
    :cond_4
    iget-object p1, p0, Llq0;->h:Ljava/lang/Integer;

    .line 107
    .line 108
    if-eqz p1, :cond_5

    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    invoke-static {v5, p1}, Lkq0;->f(Landroid/app/Notification$CallStyle;I)Landroid/app/Notification$CallStyle;

    .line 115
    .line 116
    .line 117
    :cond_5
    iget-object p1, p0, Llq0;->j:Ljava/lang/CharSequence;

    .line 118
    .line 119
    invoke-static {v5, p1}, Lkq0;->i(Landroid/app/Notification$CallStyle;Ljava/lang/CharSequence;)Landroid/app/Notification$CallStyle;

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Llq0;->i:Landroidx/core/graphics/drawable/IconCompat;

    .line 123
    .line 124
    if-eqz p1, :cond_6

    .line 125
    .line 126
    iget-object v0, p0, Lvq0;->mBuilder:Lgq0;

    .line 127
    .line 128
    iget-object v0, v0, Lgq0;->a:Landroid/content/Context;

    .line 129
    .line 130
    invoke-static {p1, v0}, Lld0;->g(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {v5, p1}, Lkq0;->h(Landroid/app/Notification$CallStyle;Landroid/graphics/drawable/Icon;)Landroid/app/Notification$CallStyle;

    .line 135
    .line 136
    .line 137
    :cond_6
    iget-boolean p0, p0, Llq0;->f:Z

    .line 138
    .line 139
    invoke-static {v5, p0}, Lkq0;->g(Landroid/app/Notification$CallStyle;Z)Landroid/app/Notification$CallStyle;

    .line 140
    .line 141
    .line 142
    :cond_7
    return-void

    .line 143
    :cond_8
    check-cast p1, Ler0;

    .line 144
    .line 145
    iget-object p1, p1, Ler0;->l:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast p1, Landroid/app/Notification$Builder;

    .line 148
    .line 149
    iget-object v1, p0, Llq0;->b:Let0;

    .line 150
    .line 151
    if-eqz v1, :cond_9

    .line 152
    .line 153
    iget-object v1, v1, Let0;->a:Ljava/lang/CharSequence;

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_9
    move-object v1, v5

    .line 157
    :goto_1
    invoke-virtual {p1, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lvq0;->mBuilder:Lgq0;

    .line 161
    .line 162
    iget-object v1, v1, Lgq0;->m:Landroid/os/Bundle;

    .line 163
    .line 164
    if-eqz v1, :cond_a

    .line 165
    .line 166
    const-string v6, "android.text"

    .line 167
    .line 168
    invoke-virtual {v1, v6}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    if-eqz v1, :cond_a

    .line 173
    .line 174
    iget-object v1, p0, Lvq0;->mBuilder:Lgq0;

    .line 175
    .line 176
    iget-object v1, v1, Lgq0;->m:Landroid/os/Bundle;

    .line 177
    .line 178
    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    goto :goto_2

    .line 183
    :cond_a
    move-object v1, v5

    .line 184
    :goto_2
    if-nez v1, :cond_e

    .line 185
    .line 186
    iget v1, p0, Llq0;->a:I

    .line 187
    .line 188
    if-eq v1, v3, :cond_d

    .line 189
    .line 190
    if-eq v1, v2, :cond_c

    .line 191
    .line 192
    if-eq v1, v4, :cond_b

    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_b
    iget-object v1, p0, Lvq0;->mBuilder:Lgq0;

    .line 196
    .line 197
    iget-object v1, v1, Lgq0;->a:Landroid/content/Context;

    .line 198
    .line 199
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    const v2, 0x7f110030

    .line 204
    .line 205
    .line 206
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    goto :goto_3

    .line 211
    :cond_c
    iget-object v1, p0, Lvq0;->mBuilder:Lgq0;

    .line 212
    .line 213
    iget-object v1, v1, Lgq0;->a:Landroid/content/Context;

    .line 214
    .line 215
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    const v2, 0x7f11002f

    .line 220
    .line 221
    .line 222
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    goto :goto_3

    .line 227
    :cond_d
    iget-object v1, p0, Lvq0;->mBuilder:Lgq0;

    .line 228
    .line 229
    iget-object v1, v1, Lgq0;->a:Landroid/content/Context;

    .line 230
    .line 231
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    const v2, 0x7f11002e

    .line 236
    .line 237
    .line 238
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v5

    .line 242
    :goto_3
    move-object v1, v5

    .line 243
    :cond_e
    invoke-virtual {p1, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 244
    .line 245
    .line 246
    iget-object v1, p0, Llq0;->b:Let0;

    .line 247
    .line 248
    if-eqz v1, :cond_11

    .line 249
    .line 250
    iget-object v1, v1, Let0;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 251
    .line 252
    if-eqz v1, :cond_f

    .line 253
    .line 254
    iget-object v2, p0, Lvq0;->mBuilder:Lgq0;

    .line 255
    .line 256
    iget-object v2, v2, Lgq0;->a:Landroid/content/Context;

    .line 257
    .line 258
    invoke-static {v1, v2}, Lld0;->g(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    invoke-static {p1, v1}, Liq0;->c(Landroid/app/Notification$Builder;Landroid/graphics/drawable/Icon;)V

    .line 263
    .line 264
    .line 265
    :cond_f
    iget-object p0, p0, Llq0;->b:Let0;

    .line 266
    .line 267
    const/16 v1, 0x1c

    .line 268
    .line 269
    if-lt v0, v1, :cond_10

    .line 270
    .line 271
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 272
    .line 273
    .line 274
    invoke-static {p0}, Ldt0;->b(Let0;)Landroid/app/Person;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    invoke-static {p1, p0}, Ljq0;->a(Landroid/app/Notification$Builder;Landroid/app/Person;)Landroid/app/Notification$Builder;

    .line 279
    .line 280
    .line 281
    goto :goto_4

    .line 282
    :cond_10
    iget-object p0, p0, Let0;->c:Ljava/lang/String;

    .line 283
    .line 284
    invoke-static {p1, p0}, Lhq0;->a(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 285
    .line 286
    .line 287
    :cond_11
    :goto_4
    const-string p0, "call"

    .line 288
    .line 289
    invoke-static {p1, p0}, Lhq0;->b(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 290
    .line 291
    .line 292
    return-void
.end method

.method public final c(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Lbq0;
    .locals 2

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iget-object p3, p0, Lvq0;->mBuilder:Lgq0;

    .line 4
    .line 5
    iget-object p3, p3, Lgq0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p3, p4}, Lbq;->a(Landroid/content/Context;I)I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    :cond_0
    new-instance p4, Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    invoke-direct {p4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lvq0;->mBuilder:Lgq0;

    .line 21
    .line 22
    iget-object v0, v0, Lgq0;->a:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p4, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 33
    .line 34
    .line 35
    new-instance p2, Landroid/text/style/ForegroundColorSpan;

    .line 36
    .line 37
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    invoke-direct {p2, p3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p4}, Landroid/text/SpannableStringBuilder;->length()I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    const/16 v0, 0x12

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p4, p2, v1, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 52
    .line 53
    .line 54
    new-instance p2, Laq0;

    .line 55
    .line 56
    iget-object p0, p0, Lvq0;->mBuilder:Lgq0;

    .line 57
    .line 58
    iget-object p0, p0, Lgq0;->a:Landroid/content/Context;

    .line 59
    .line 60
    sget-object p3, Landroidx/core/graphics/drawable/IconCompat;->k:Landroid/graphics/PorterDuff$Mode;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p3, p0, p1}, Landroidx/core/graphics/drawable/IconCompat;->c(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance p1, Landroid/os/Bundle;

    .line 78
    .line 79
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-direct {p2, p0, p4, p5, p1}, Laq0;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Laq0;->a()Lbq0;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-object p1, p0, Lbq0;->a:Landroid/os/Bundle;

    .line 90
    .line 91
    const-string p2, "key_action_priority"

    .line 92
    .line 93
    const/4 p3, 0x1

    .line 94
    invoke-virtual {p1, p2, p3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 95
    .line 96
    .line 97
    return-object p0
.end method

.method public final displayCustomViewInline()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final getClassName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "androidx.core.app.NotificationCompat$CallStyle"

    .line 2
    .line 3
    return-object p0
.end method

.method public final restoreFromCompatExtras(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lvq0;->restoreFromCompatExtras(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android.callType"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Llq0;->a:I

    .line 11
    .line 12
    const-string v0, "android.callIsVideo"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput-boolean v0, p0, Llq0;->f:Z

    .line 19
    .line 20
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 21
    .line 22
    const/16 v1, 0x1c

    .line 23
    .line 24
    if-lt v0, v1, :cond_0

    .line 25
    .line 26
    const-string v0, "android.callPerson"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ld1;->e(Landroid/os/Parcelable;)Landroid/app/Person;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Ldt0;->a(Landroid/app/Person;)Let0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Llq0;->b:Let0;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string v0, "android.callPersonCompat"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Let0;->a(Landroid/os/Bundle;)Let0;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Llq0;->b:Let0;

    .line 66
    .line 67
    :cond_1
    :goto_0
    const-string v0, "android.verificationIcon"

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Landroid/graphics/drawable/Icon;

    .line 80
    .line 81
    sget-object v1, Landroidx/core/graphics/drawable/IconCompat;->k:Landroid/graphics/PorterDuff$Mode;

    .line 82
    .line 83
    invoke-static {v0}, Lld0;->a(Landroid/graphics/drawable/Icon;)Landroidx/core/graphics/drawable/IconCompat;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Llq0;->i:Landroidx/core/graphics/drawable/IconCompat;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_2
    const-string v0, "android.verificationIconCompat"

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_3

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-static {v0}, Landroidx/core/graphics/drawable/IconCompat;->a(Landroid/os/Bundle;)Landroidx/core/graphics/drawable/IconCompat;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Llq0;->i:Landroidx/core/graphics/drawable/IconCompat;

    .line 107
    .line 108
    :cond_3
    :goto_1
    const-string v0, "android.verificationText"

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Llq0;->j:Ljava/lang/CharSequence;

    .line 115
    .line 116
    const-string v0, "android.answerIntent"

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Landroid/app/PendingIntent;

    .line 123
    .line 124
    iput-object v0, p0, Llq0;->c:Landroid/app/PendingIntent;

    .line 125
    .line 126
    const-string v0, "android.declineIntent"

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Landroid/app/PendingIntent;

    .line 133
    .line 134
    iput-object v0, p0, Llq0;->d:Landroid/app/PendingIntent;

    .line 135
    .line 136
    const-string v0, "android.hangUpIntent"

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Landroid/app/PendingIntent;

    .line 143
    .line 144
    iput-object v0, p0, Llq0;->e:Landroid/app/PendingIntent;

    .line 145
    .line 146
    const-string v0, "android.answerColor"

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    const/4 v2, 0x0

    .line 153
    if-eqz v1, :cond_4

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    goto :goto_2

    .line 164
    :cond_4
    move-object v0, v2

    .line 165
    :goto_2
    iput-object v0, p0, Llq0;->g:Ljava/lang/Integer;

    .line 166
    .line 167
    const-string v0, "android.declineColor"

    .line 168
    .line 169
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_5

    .line 174
    .line 175
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    :cond_5
    iput-object v2, p0, Llq0;->h:Ljava/lang/Integer;

    .line 184
    .line 185
    return-void
.end method
