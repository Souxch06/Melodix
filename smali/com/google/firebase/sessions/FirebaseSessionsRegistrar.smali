.class public final Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# static fields
.field private static final Companion:Lm50;

.field public static final LIBRARY_NAME:Ljava/lang/String; = "fire-sessions"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final appContext:Lsw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lsw0;"
        }
    .end annotation
.end field

.field private static final backgroundDispatcher:Lsw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lsw0;"
        }
    .end annotation
.end field

.field private static final blockingDispatcher:Lsw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lsw0;"
        }
    .end annotation
.end field

.field private static final firebaseApp:Lsw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lsw0;"
        }
    .end annotation
.end field

.field private static final firebaseInstallationsApi:Lsw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lsw0;"
        }
    .end annotation
.end field

.field private static final firebaseSessionsComponent:Lsw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lsw0;"
        }
    .end annotation
.end field

.field private static final transportFactory:Lsw0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lsw0;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lm50;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->Companion:Lm50;

    .line 7
    .line 8
    const-class v0, Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {v0}, Lsw0;->a(Ljava/lang/Class;)Lsw0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->appContext:Lsw0;

    .line 15
    .line 16
    const-class v0, Lu30;

    .line 17
    .line 18
    invoke-static {v0}, Lsw0;->a(Ljava/lang/Class;)Lsw0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseApp:Lsw0;

    .line 23
    .line 24
    const-class v0, Lh40;

    .line 25
    .line 26
    invoke-static {v0}, Lsw0;->a(Ljava/lang/Class;)Lsw0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseInstallationsApi:Lsw0;

    .line 31
    .line 32
    new-instance v0, Lsw0;

    .line 33
    .line 34
    const-class v1, Lwf;

    .line 35
    .line 36
    const-class v2, Luq;

    .line 37
    .line 38
    invoke-direct {v0, v1, v2}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->backgroundDispatcher:Lsw0;

    .line 42
    .line 43
    new-instance v0, Lsw0;

    .line 44
    .line 45
    const-class v1, Lqg;

    .line 46
    .line 47
    invoke-direct {v0, v1, v2}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->blockingDispatcher:Lsw0;

    .line 51
    .line 52
    const-class v0, Lqd1;

    .line 53
    .line 54
    invoke-static {v0}, Lsw0;->a(Ljava/lang/Class;)Lsw0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sput-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->transportFactory:Lsw0;

    .line 59
    .line 60
    const-class v0, Lh50;

    .line 61
    .line 62
    invoke-static {v0}, Lsw0;->a(Ljava/lang/Class;)Lsw0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseSessionsComponent:Lsw0;

    .line 67
    .line 68
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Li7;)Lh50;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->getComponents$lambda$1(Lgm;)Lh50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$getAppContext$cp()Lsw0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->appContext:Lsw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getBackgroundDispatcher$cp()Lsw0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->backgroundDispatcher:Lsw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getBlockingDispatcher$cp()Lsw0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->blockingDispatcher:Lsw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getFirebaseApp$cp()Lsw0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseApp:Lsw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getFirebaseInstallationsApi$cp()Lsw0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseInstallationsApi:Lsw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getFirebaseSessionsComponent$cp()Lsw0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseSessionsComponent:Lsw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getTransportFactory$cp()Lsw0;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->transportFactory:Lsw0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic b(Li7;)Lf50;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->getComponents$lambda$0(Lgm;)Lf50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final getComponents$lambda$0(Lgm;)Lf50;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseSessionsComponent:Lsw0;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lh50;

    .line 8
    .line 9
    check-cast p0, Lmt;

    .line 10
    .line 11
    iget-object p0, p0, Lmt;->p:Ljw0;

    .line 12
    .line 13
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lf50;

    .line 18
    .line 19
    return-object p0
.end method

.method private static final getComponents$lambda$1(Lgm;)Lh50;
    .locals 15

    .line 1
    sget-object v0, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->appContext:Lsw0;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast v0, Landroid/content/Context;

    .line 11
    .line 12
    sget-object v1, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->backgroundDispatcher:Lsw0;

    .line 13
    .line 14
    invoke-interface {p0, v1}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    check-cast v1, Lsq;

    .line 22
    .line 23
    sget-object v2, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->blockingDispatcher:Lsw0;

    .line 24
    .line 25
    invoke-interface {p0, v2}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    check-cast v2, Lsq;

    .line 33
    .line 34
    sget-object v3, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseApp:Lsw0;

    .line 35
    .line 36
    invoke-interface {p0, v3}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    check-cast v3, Lu30;

    .line 44
    .line 45
    sget-object v4, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseInstallationsApi:Lsw0;

    .line 46
    .line 47
    invoke-interface {p0, v4}, Lgm;->g(Lsw0;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    check-cast v4, Lh40;

    .line 55
    .line 56
    sget-object v5, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->transportFactory:Lsw0;

    .line 57
    .line 58
    invoke-interface {p0, v5}, Lgm;->f(Lsw0;)Llw0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    new-instance v5, Lmt;

    .line 66
    .line 67
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v3}, Lbv1;->m(Ljava/lang/Object;)Lbv1;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iput-object v3, v5, Lmt;->a:Lbv1;

    .line 75
    .line 76
    invoke-static {v0}, Lbv1;->m(Ljava/lang/Object;)Lbv1;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, v5, Lmt;->b:Lbv1;

    .line 81
    .line 82
    new-instance v3, Lbv1;

    .line 83
    .line 84
    const/16 v6, 0x1a

    .line 85
    .line 86
    invoke-direct {v3, v6, v0}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v3}, Ljy;->a(Ljw0;)Ljw0;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, v5, Lmt;->c:Ljw0;

    .line 94
    .line 95
    sget-object v0, Lk42;->l:Lmz;

    .line 96
    .line 97
    invoke-static {v0}, Ljy;->a(Ljw0;)Ljw0;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, v5, Lmt;->d:Ljw0;

    .line 102
    .line 103
    invoke-static {v4}, Lbv1;->m(Ljava/lang/Object;)Lbv1;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, v5, Lmt;->e:Lbv1;

    .line 108
    .line 109
    iget-object v0, v5, Lmt;->a:Lbv1;

    .line 110
    .line 111
    new-instance v3, Lg10;

    .line 112
    .line 113
    const/4 v4, 0x1

    .line 114
    invoke-direct {v3, v0, v4}, Lg10;-><init>(Lbv1;I)V

    .line 115
    .line 116
    .line 117
    invoke-static {v3}, Ljy;->a(Ljw0;)Ljw0;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, v5, Lmt;->f:Ljw0;

    .line 122
    .line 123
    invoke-static {v2}, Lbv1;->m(Ljava/lang/Object;)Lbv1;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, v5, Lmt;->g:Lbv1;

    .line 128
    .line 129
    iget-object v2, v5, Lmt;->f:Ljw0;

    .line 130
    .line 131
    new-instance v3, Li50;

    .line 132
    .line 133
    invoke-direct {v3, v2, v0}, Li50;-><init>(Ljw0;Lbv1;)V

    .line 134
    .line 135
    .line 136
    invoke-static {v3}, Ljy;->a(Ljw0;)Ljw0;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, v5, Lmt;->h:Ljw0;

    .line 141
    .line 142
    invoke-static {v1}, Lbv1;->m(Ljava/lang/Object;)Lbv1;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, v5, Lmt;->i:Lbv1;

    .line 147
    .line 148
    iget-object v0, v5, Lmt;->b:Lbv1;

    .line 149
    .line 150
    iget-object v1, v5, Lmt;->g:Lbv1;

    .line 151
    .line 152
    new-instance v2, Li50;

    .line 153
    .line 154
    const/4 v3, 0x0

    .line 155
    invoke-direct {v2, v0, v1, v3}, Li50;-><init>(Lbv1;Ljw0;I)V

    .line 156
    .line 157
    .line 158
    invoke-static {v2}, Ljy;->a(Ljw0;)Ljw0;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v1, v5, Lmt;->i:Lbv1;

    .line 163
    .line 164
    iget-object v2, v5, Lmt;->d:Ljw0;

    .line 165
    .line 166
    new-instance v6, Lc9;

    .line 167
    .line 168
    const/16 v7, 0x15

    .line 169
    .line 170
    invoke-direct {v6, v1, v2, v0, v7}, Lc9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 171
    .line 172
    .line 173
    invoke-static {v6}, Ljy;->a(Ljw0;)Ljw0;

    .line 174
    .line 175
    .line 176
    move-result-object v13

    .line 177
    iget-object v9, v5, Lmt;->d:Ljw0;

    .line 178
    .line 179
    iget-object v10, v5, Lmt;->e:Lbv1;

    .line 180
    .line 181
    iget-object v11, v5, Lmt;->f:Ljw0;

    .line 182
    .line 183
    iget-object v12, v5, Lmt;->h:Ljw0;

    .line 184
    .line 185
    new-instance v8, Law;

    .line 186
    .line 187
    const/4 v14, 0x2

    .line 188
    invoke-direct/range {v8 .. v14}, Law;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 189
    .line 190
    .line 191
    invoke-static {v8}, Ljy;->a(Ljw0;)Ljw0;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iget-object v1, v5, Lmt;->c:Ljw0;

    .line 196
    .line 197
    new-instance v2, Lf51;

    .line 198
    .line 199
    invoke-direct {v2, v1, v0, v4}, Lf51;-><init>(Ljw0;Ljw0;I)V

    .line 200
    .line 201
    .line 202
    invoke-static {v2}, Ljy;->a(Ljw0;)Ljw0;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iput-object v0, v5, Lmt;->j:Ljw0;

    .line 207
    .line 208
    sget-object v0, Lcg1;->c:Ltb0;

    .line 209
    .line 210
    invoke-static {v0}, Ljy;->a(Ljw0;)Ljw0;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    iput-object v0, v5, Lmt;->k:Ljw0;

    .line 215
    .line 216
    iget-object v1, v5, Lmt;->d:Ljw0;

    .line 217
    .line 218
    new-instance v2, Lf51;

    .line 219
    .line 220
    invoke-direct {v2, v1, v0, v3}, Lf51;-><init>(Ljw0;Ljw0;I)V

    .line 221
    .line 222
    .line 223
    invoke-static {v2}, Ljy;->a(Ljw0;)Ljw0;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    iput-object v0, v5, Lmt;->l:Ljw0;

    .line 228
    .line 229
    invoke-static {p0}, Lbv1;->m(Ljava/lang/Object;)Lbv1;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    new-instance v0, Lg10;

    .line 234
    .line 235
    invoke-direct {v0, p0, v3}, Lg10;-><init>(Lbv1;I)V

    .line 236
    .line 237
    .line 238
    invoke-static {v0}, Ljy;->a(Ljw0;)Ljw0;

    .line 239
    .line 240
    .line 241
    move-result-object v10

    .line 242
    iget-object v7, v5, Lmt;->a:Lbv1;

    .line 243
    .line 244
    iget-object v8, v5, Lmt;->e:Lbv1;

    .line 245
    .line 246
    iget-object v9, v5, Lmt;->j:Ljw0;

    .line 247
    .line 248
    iget-object v11, v5, Lmt;->i:Lbv1;

    .line 249
    .line 250
    new-instance v6, Law;

    .line 251
    .line 252
    const/4 v12, 0x3

    .line 253
    invoke-direct/range {v6 .. v12}, Law;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 254
    .line 255
    .line 256
    invoke-static {v6}, Ljy;->a(Ljw0;)Ljw0;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    iput-object p0, v5, Lmt;->m:Ljw0;

    .line 261
    .line 262
    iget-object p0, v5, Lmt;->l:Ljw0;

    .line 263
    .line 264
    new-instance v0, Lny0;

    .line 265
    .line 266
    const/4 v1, 0x4

    .line 267
    invoke-direct {v0, v1, p0}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 268
    .line 269
    .line 270
    invoke-static {v0}, Ljy;->a(Ljw0;)Ljw0;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    iget-object v0, v5, Lmt;->b:Lbv1;

    .line 275
    .line 276
    iget-object v1, v5, Lmt;->g:Lbv1;

    .line 277
    .line 278
    new-instance v2, Lc9;

    .line 279
    .line 280
    const/16 v3, 0xb

    .line 281
    .line 282
    invoke-direct {v2, v0, v1, p0, v3}, Lc9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 283
    .line 284
    .line 285
    invoke-static {v2}, Ljy;->a(Ljw0;)Ljw0;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    iput-object p0, v5, Lmt;->n:Ljw0;

    .line 290
    .line 291
    iget-object p0, v5, Lmt;->b:Lbv1;

    .line 292
    .line 293
    iget-object v0, v5, Lmt;->k:Ljw0;

    .line 294
    .line 295
    new-instance v1, Li50;

    .line 296
    .line 297
    invoke-direct {v1, p0, v0, v4}, Li50;-><init>(Lbv1;Ljw0;I)V

    .line 298
    .line 299
    .line 300
    invoke-static {v1}, Ljy;->a(Ljw0;)Ljw0;

    .line 301
    .line 302
    .line 303
    move-result-object v12

    .line 304
    iget-object v7, v5, Lmt;->j:Ljw0;

    .line 305
    .line 306
    iget-object v8, v5, Lmt;->l:Ljw0;

    .line 307
    .line 308
    iget-object v9, v5, Lmt;->m:Ljw0;

    .line 309
    .line 310
    iget-object v10, v5, Lmt;->d:Ljw0;

    .line 311
    .line 312
    iget-object v11, v5, Lmt;->n:Ljw0;

    .line 313
    .line 314
    iget-object v13, v5, Lmt;->i:Lbv1;

    .line 315
    .line 316
    new-instance v6, Lm30;

    .line 317
    .line 318
    invoke-direct/range {v6 .. v13}, Lm30;-><init>(Ljw0;Ljw0;Ljw0;Ljw0;Ljw0;Ljw0;Ljw0;)V

    .line 319
    .line 320
    .line 321
    invoke-static {v6}, Ljy;->a(Ljw0;)Ljw0;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    iput-object p0, v5, Lmt;->o:Ljw0;

    .line 326
    .line 327
    new-instance v0, Lpa0;

    .line 328
    .line 329
    const/16 v1, 0x18

    .line 330
    .line 331
    invoke-direct {v0, v1, p0}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 332
    .line 333
    .line 334
    invoke-static {v0}, Ljy;->a(Ljw0;)Ljw0;

    .line 335
    .line 336
    .line 337
    move-result-object v10

    .line 338
    iget-object v7, v5, Lmt;->a:Lbv1;

    .line 339
    .line 340
    iget-object v8, v5, Lmt;->j:Ljw0;

    .line 341
    .line 342
    iget-object v9, v5, Lmt;->i:Lbv1;

    .line 343
    .line 344
    new-instance v6, Ler0;

    .line 345
    .line 346
    const/4 v11, 0x7

    .line 347
    invoke-direct/range {v6 .. v11}, Ler0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 348
    .line 349
    .line 350
    invoke-static {v6}, Ljy;->a(Ljw0;)Ljw0;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    iput-object p0, v5, Lmt;->p:Ljw0;

    .line 355
    .line 356
    return-object v5
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lwl;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lf50;

    .line 2
    .line 3
    invoke-static {p0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "fire-sessions"

    .line 8
    .line 9
    iput-object v0, p0, Lvl;->a:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v1, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseSessionsComponent:Lsw0;

    .line 12
    .line 13
    invoke-static {v1}, Lbx;->a(Lsw0;)Lbx;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, v1}, Lvl;->a(Lbx;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lo40;

    .line 21
    .line 22
    const/4 v2, 0x3

    .line 23
    invoke-direct {v1, v2}, Lo40;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lvl;->f:Ljm;

    .line 27
    .line 28
    invoke-virtual {p0}, Lvl;->c()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lvl;->b()Lwl;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-class v1, Lh50;

    .line 36
    .line 37
    invoke-static {v1}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "fire-sessions-component"

    .line 42
    .line 43
    iput-object v2, v1, Lvl;->a:Ljava/lang/String;

    .line 44
    .line 45
    sget-object v2, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->appContext:Lsw0;

    .line 46
    .line 47
    invoke-static {v2}, Lbx;->a(Lsw0;)Lbx;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v1, v2}, Lvl;->a(Lbx;)V

    .line 52
    .line 53
    .line 54
    sget-object v2, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->backgroundDispatcher:Lsw0;

    .line 55
    .line 56
    invoke-static {v2}, Lbx;->a(Lsw0;)Lbx;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Lvl;->a(Lbx;)V

    .line 61
    .line 62
    .line 63
    sget-object v2, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->blockingDispatcher:Lsw0;

    .line 64
    .line 65
    invoke-static {v2}, Lbx;->a(Lsw0;)Lbx;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Lvl;->a(Lbx;)V

    .line 70
    .line 71
    .line 72
    sget-object v2, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseApp:Lsw0;

    .line 73
    .line 74
    invoke-static {v2}, Lbx;->a(Lsw0;)Lbx;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v1, v2}, Lvl;->a(Lbx;)V

    .line 79
    .line 80
    .line 81
    sget-object v2, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->firebaseInstallationsApi:Lsw0;

    .line 82
    .line 83
    invoke-static {v2}, Lbx;->a(Lsw0;)Lbx;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Lvl;->a(Lbx;)V

    .line 88
    .line 89
    .line 90
    sget-object v2, Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;->transportFactory:Lsw0;

    .line 91
    .line 92
    new-instance v3, Lbx;

    .line 93
    .line 94
    const/4 v4, 0x1

    .line 95
    invoke-direct {v3, v2, v4, v4}, Lbx;-><init>(Lsw0;II)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v3}, Lvl;->a(Lbx;)V

    .line 99
    .line 100
    .line 101
    new-instance v2, Lo40;

    .line 102
    .line 103
    const/4 v3, 0x4

    .line 104
    invoke-direct {v2, v3}, Lo40;-><init>(I)V

    .line 105
    .line 106
    .line 107
    iput-object v2, v1, Lvl;->f:Ljm;

    .line 108
    .line 109
    invoke-virtual {v1}, Lvl;->b()Lwl;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "3.0.5"

    .line 114
    .line 115
    invoke-static {v0, v2}, Lju1;->j(Ljava/lang/String;Ljava/lang/String;)Lwl;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    filled-new-array {p0, v1, v0}, [Lwl;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    return-object p0
.end method
