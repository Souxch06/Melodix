.class public final Lcm1;
.super Lhl1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lxa0;
.implements Lya0;


# static fields
.field public static final j:Ldl1;


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Landroid/os/Handler;

.field public final e:Ldl1;

.field public final f:Ljava/util/Set;

.field public final g:Li7;

.field public h:Ls71;

.field public i:Lpl1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lem1;->a:Ldl1;

    .line 2
    .line 3
    sput-object v0, Lcm1;->j:Ldl1;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lum1;Li7;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lhl1;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "com.google.android.gms.signin.internal.ISignInCallbacks"

    .line 5
    .line 6
    invoke-virtual {p0, p0, v0}, Landroid/os/Binder;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcm1;->c:Landroid/content/Context;

    .line 10
    .line 11
    iput-object p2, p0, Lcm1;->d:Landroid/os/Handler;

    .line 12
    .line 13
    iput-object p3, p0, Lcm1;->g:Li7;

    .line 14
    .line 15
    iget-object p1, p3, Li7;->j:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/util/Set;

    .line 18
    .line 19
    iput-object p1, p0, Lcm1;->f:Ljava/util/Set;

    .line 20
    .line 21
    sget-object p1, Lcm1;->j:Ldl1;

    .line 22
    .line 23
    iput-object p1, p0, Lcm1;->e:Ldl1;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcm1;->i:Lpl1;

    .line 2
    .line 3
    iget-object v0, p0, Lpl1;->o:Lza0;

    .line 4
    .line 5
    iget-object v0, v0, Lza0;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 6
    .line 7
    iget-object p0, p0, Lpl1;->k:Lb6;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lml1;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Lml1;->j:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    new-instance p1, Loo;

    .line 22
    .line 23
    const/16 v0, 0x11

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-direct {p1, v0, v1, v1}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lml1;->p(Loo;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0, p1}, Lml1;->a(I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final b(Loo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcm1;->i:Lpl1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lpl1;->a(Loo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onConnected()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcm1;->h:Ls71;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v1, "<<default account>>"

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    :try_start_0
    iget-object v4, v0, Ls71;->J:Li7;

    .line 11
    .line 12
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    new-instance v4, Landroid/accounts/Account;

    .line 16
    .line 17
    const-string v5, "com.google"

    .line 18
    .line 19
    invoke-direct {v4, v1, v5}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v5, v4, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    iget-object v1, v0, Ljg;->l:Landroid/content/Context;

    .line 31
    .line 32
    sget-object v5, Lw91;->c:Ljava/util/concurrent/locks/ReentrantLock;

    .line 33
    .line 34
    invoke-static {v1}, Lbh;->h(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    sget-object v5, Lw91;->c:Ljava/util/concurrent/locks/ReentrantLock;

    .line 38
    .line 39
    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :try_start_1
    sget-object v6, Lw91;->d:Lw91;

    .line 43
    .line 44
    if-nez v6, :cond_0

    .line 45
    .line 46
    new-instance v6, Lw91;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {v6, v1}, Lw91;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    sput-object v6, Lw91;->d:Lw91;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    :goto_0
    :try_start_2
    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 61
    .line 62
    .line 63
    const-string v1, "defaultGoogleSignInAccount"

    .line 64
    .line 65
    invoke-virtual {v6, v1}, Lw91;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-eqz v5, :cond_1

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v7, "googleSignInAccount:"

    .line 79
    .line 80
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v6, v1}, Lw91;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    .line 94
    if-eqz v1, :cond_2

    .line 95
    .line 96
    :try_start_3
    invoke-static {v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->b(Ljava/lang/String;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 97
    .line 98
    .line 99
    move-result-object v1
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    .line 100
    goto :goto_3

    .line 101
    :goto_1
    :try_start_4
    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 102
    .line 103
    .line 104
    throw v0

    .line 105
    :catch_0
    move-exception v0

    .line 106
    goto :goto_4

    .line 107
    :catch_1
    :cond_2
    :goto_2
    move-object v1, v3

    .line 108
    :goto_3
    new-instance v5, Ltm1;

    .line 109
    .line 110
    iget-object v6, v0, Ls71;->L:Ljava/lang/Integer;

    .line 111
    .line 112
    invoke-static {v6}, Lbh;->h(Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 116
    .line 117
    .line 118
    move-result v6

    .line 119
    const/4 v7, 0x2

    .line 120
    invoke-direct {v5, v7, v4, v6, v1}, Ltm1;-><init>(ILandroid/accounts/Account;ILcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljg;->s()Landroid/os/IInterface;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lhm1;

    .line 128
    .line 129
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iget-object v4, v0, Lfl1;->d:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sget v4, Ltl1;->a:I

    .line 139
    .line 140
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 141
    .line 142
    .line 143
    const/16 v4, 0x4f45

    .line 144
    .line 145
    invoke-static {v1, v4}, Lbe2;->L(Landroid/os/Parcel;I)I

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    const/4 v6, 0x4

    .line 150
    invoke-static {v1, v2, v6}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 154
    .line 155
    .line 156
    const/4 v6, 0x0

    .line 157
    invoke-static {v1, v7, v5, v6}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 158
    .line 159
    .line 160
    invoke-static {v1, v4}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, p0}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 164
    .line 165
    .line 166
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 167
    .line 168
    .line 169
    move-result-object v4
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0

    .line 170
    :try_start_5
    iget-object v0, v0, Lfl1;->c:Landroid/os/IBinder;

    .line 171
    .line 172
    const/16 v5, 0xc

    .line 173
    .line 174
    invoke-interface {v0, v5, v1, v4, v6}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 175
    .line 176
    .line 177
    invoke-virtual {v4}, Landroid/os/Parcel;->readException()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 178
    .line 179
    .line 180
    :try_start_6
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    .line 184
    .line 185
    .line 186
    goto :goto_5

    .line 187
    :catchall_1
    move-exception v0

    .line 188
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    .line 192
    .line 193
    .line 194
    throw v0
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_0

    .line 195
    :goto_4
    :try_start_7
    new-instance v1, Lnm1;

    .line 196
    .line 197
    new-instance v4, Loo;

    .line 198
    .line 199
    const/16 v5, 0x8

    .line 200
    .line 201
    invoke-direct {v4, v5, v3, v3}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-direct {v1, v2, v4, v3}, Lnm1;-><init>(ILoo;Lvm1;)V

    .line 205
    .line 206
    .line 207
    new-instance v2, Lbm1;

    .line 208
    .line 209
    invoke-direct {v2, p0, v1}, Lbm1;-><init>(Lcm1;Lnm1;)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Lcm1;->d:Landroid/os/Handler;

    .line 213
    .line 214
    invoke-virtual {p0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_2

    .line 215
    .line 216
    .line 217
    goto :goto_5

    .line 218
    :catch_2
    const-string p0, "SignInClientImpl"

    .line 219
    .line 220
    const-string v1, "ISignInCallbacks#onSignInComplete should be executed from the same process, unexpected RemoteException."

    .line 221
    .line 222
    invoke-static {p0, v1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 223
    .line 224
    .line 225
    :goto_5
    return-void
.end method
