.class public final Lg30;
.super Lih0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic k:I

.field public final synthetic l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lg30;->k:I

    .line 2
    .line 3
    iput-object p2, p0, Lg30;->l:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lih0;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 8

    .line 1
    iget v0, p0, Lg30;->k:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lg30;->l:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Lii1;

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    const-class v3, Lv21;

    .line 18
    .line 19
    invoke-static {v3}, Liz0;->a(Ljava/lang/Class;)Lhk;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    new-instance v5, Lgi1;

    .line 24
    .line 25
    iget-object v4, v4, Lhk;->a:Ljava/lang/Class;

    .line 26
    .line 27
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-direct {v5, v4}, Lgi1;-><init>(Ljava/lang/Class;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    new-array v4, v2, [Lgi1;

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, [Lgi1;

    .line 43
    .line 44
    array-length v4, v0

    .line 45
    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, [Lgi1;

    .line 50
    .line 51
    invoke-interface {p0}, Lii1;->d()Lhi1;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    instance-of v5, p0, Lob0;

    .line 56
    .line 57
    if-eqz v5, :cond_0

    .line 58
    .line 59
    check-cast p0, Lob0;

    .line 60
    .line 61
    invoke-interface {p0}, Lob0;->c()Lwo0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    sget-object p0, Ldt;->k:Ldt;

    .line 67
    .line 68
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    iget-object v4, v4, Lhi1;->a:Ljava/util/LinkedHashMap;

    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    const-string v5, "androidx.lifecycle.internal.SavedStateHandlesVM"

    .line 77
    .line 78
    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    check-cast v6, Lfi1;

    .line 83
    .line 84
    invoke-virtual {v3, v6}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    if-eqz v7, :cond_1

    .line 89
    .line 90
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_1
    new-instance v6, Ljava/util/LinkedHashMap;

    .line 95
    .line 96
    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast p0, Ljava/util/LinkedHashMap;

    .line 102
    .line 103
    invoke-interface {v6, p0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 104
    .line 105
    .line 106
    sget-object p0, Lt11;->q:Lt11;

    .line 107
    .line 108
    invoke-interface {v6, p0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    :try_start_0
    array-length p0, v0

    .line 112
    :goto_1
    if-ge v2, p0, :cond_3

    .line 113
    .line 114
    aget-object v6, v0, v2

    .line 115
    .line 116
    iget-object v6, v6, Lgi1;->a:Ljava/lang/Class;

    .line 117
    .line 118
    invoke-virtual {v6, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    if-eqz v6, :cond_2

    .line 123
    .line 124
    new-instance v1, Lv21;

    .line 125
    .line 126
    invoke-direct {v1}, Lv21;-><init>()V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .line 128
    .line 129
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_3
    if-eqz v1, :cond_5

    .line 133
    .line 134
    invoke-interface {v4, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    check-cast p0, Lfi1;

    .line 139
    .line 140
    if-eqz p0, :cond_4

    .line 141
    .line 142
    invoke-virtual {p0}, Lfi1;->a()V

    .line 143
    .line 144
    .line 145
    :cond_4
    move-object v6, v1

    .line 146
    :goto_2
    check-cast v6, Lv21;

    .line 147
    .line 148
    return-object v6

    .line 149
    :cond_5
    :try_start_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 150
    .line 151
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    const-string v1, "No initializer set for given class "

    .line 156
    .line 157
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw p0
    :try_end_1
    .catch Ljava/lang/AbstractMethodError; {:try_start_1 .. :try_end_1} :catch_0

    .line 165
    :catch_0
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 166
    .line 167
    const-string v0, "Factory.create(String) is unsupported.  This Factory requires `CreationExtras` to be passed into `create` method."

    .line 168
    .line 169
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    throw p0

    .line 173
    :pswitch_0
    iget-object p0, p0, Lg30;->l:Ljava/lang/Object;

    .line 174
    .line 175
    check-cast p0, Lwt0;

    .line 176
    .line 177
    invoke-virtual {p0}, Lwt0;->a()Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    check-cast p0, Ljava/io/File;

    .line 182
    .line 183
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 188
    .line 189
    .line 190
    const-string v3, ""

    .line 191
    .line 192
    const/4 v4, 0x6

    .line 193
    const/16 v5, 0x2e

    .line 194
    .line 195
    invoke-static {v0, v5, v2, v4}, Lda1;->G(Ljava/lang/String;CII)I

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    const/4 v4, -0x1

    .line 200
    if-ne v2, v4, :cond_6

    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 204
    .line 205
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    :goto_3
    const-string v0, "preferences_pb"

    .line 214
    .line 215
    invoke-virtual {v3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    if-eqz v0, :cond_7

    .line 220
    .line 221
    invoke-virtual {p0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 226
    .line 227
    .line 228
    goto :goto_4

    .line 229
    :cond_7
    const-string v0, "File extension for file: "

    .line 230
    .line 231
    const-string v2, " does not match required extension for Preferences file: preferences_pb"

    .line 232
    .line 233
    invoke-static {v0, p0, v2}, Lo40;->r(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    :goto_4
    return-object v1

    .line 237
    :pswitch_1
    iget-object p0, p0, Lg30;->l:Ljava/lang/Object;

    .line 238
    .line 239
    check-cast p0, Liy;

    .line 240
    .line 241
    invoke-interface {p0}, Liy;->a()V

    .line 242
    .line 243
    .line 244
    sget-object p0, Lwe1;->a:Lwe1;

    .line 245
    .line 246
    return-object p0

    .line 247
    :pswitch_2
    :try_start_2
    iget-object p0, p0, Lg30;->l:Ljava/lang/Object;

    .line 248
    .line 249
    check-cast p0, Lp80;

    .line 250
    .line 251
    invoke-interface {p0}, Lp80;->a()Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    check-cast p0, Ljava/util/List;
    :try_end_2
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_2 .. :try_end_2} :catch_1

    .line 256
    .line 257
    goto :goto_5

    .line 258
    :catch_1
    sget-object p0, Lu00;->j:Lu00;

    .line 259
    .line 260
    :goto_5
    return-object p0

    .line 261
    :pswitch_3
    sget-object v0, Lh30;->e:Ljava/lang/Object;

    .line 262
    .line 263
    iget-object p0, p0, Lg30;->l:Ljava/lang/Object;

    .line 264
    .line 265
    check-cast p0, Ljava/io/File;

    .line 266
    .line 267
    monitor-enter v0

    .line 268
    :try_start_3
    sget-object v1, Lh30;->d:Ljava/util/LinkedHashSet;

    .line 269
    .line 270
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 275
    .line 276
    .line 277
    monitor-exit v0

    .line 278
    sget-object p0, Lwe1;->a:Lwe1;

    .line 279
    .line 280
    return-object p0

    .line 281
    :catchall_0
    move-exception p0

    .line 282
    monitor-exit v0

    .line 283
    throw p0

    .line 284
    nop

    .line 285
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
