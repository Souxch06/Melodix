.class public final Lbm1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lnm1;

.field public final synthetic k:Lcm1;


# direct methods
.method public constructor <init>(Lcm1;Lnm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lbm1;->k:Lcm1;

    .line 5
    .line 6
    iput-object p2, p0, Lbm1;->j:Lnm1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lbm1;->j:Lnm1;

    .line 2
    .line 3
    iget-object v1, v0, Lnm1;->k:Loo;

    .line 4
    .line 5
    iget v2, v1, Loo;->k:I

    .line 6
    .line 7
    iget-object p0, p0, Lbm1;->k:Lcm1;

    .line 8
    .line 9
    if-nez v2, :cond_5

    .line 10
    .line 11
    iget-object v0, v0, Lnm1;->l:Lvm1;

    .line 12
    .line 13
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, v0, Lvm1;->l:Loo;

    .line 17
    .line 18
    iget v2, v1, Loo;->k:I

    .line 19
    .line 20
    if-nez v2, :cond_4

    .line 21
    .line 22
    iget-object v1, p0, Lcm1;->i:Lpl1;

    .line 23
    .line 24
    iget-object v0, v0, Lvm1;->k:Landroid/os/IBinder;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    move-object v4, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget v3, Lx1;->c:I

    .line 32
    .line 33
    const-string v3, "com.google.android.gms.common.internal.IAccountAccessor"

    .line 34
    .line 35
    invoke-interface {v0, v3}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    instance-of v5, v4, Lgd0;

    .line 40
    .line 41
    if-eqz v5, :cond_1

    .line 42
    .line 43
    check-cast v4, Lgd0;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    new-instance v4, Lbd2;

    .line 47
    .line 48
    const/4 v5, 0x1

    .line 49
    invoke-direct {v4, v0, v3, v5}, Lfl1;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object v0, p0, Lcm1;->f:Ljava/util/Set;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    if-eqz v4, :cond_3

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    iput-object v4, v1, Lpl1;->l:Lgd0;

    .line 63
    .line 64
    iput-object v0, v1, Lpl1;->m:Ljava/util/Set;

    .line 65
    .line 66
    iget-boolean v2, v1, Lpl1;->n:Z

    .line 67
    .line 68
    if-eqz v2, :cond_6

    .line 69
    .line 70
    iget-object v1, v1, Lpl1;->j:Lu5;

    .line 71
    .line 72
    invoke-interface {v1, v4, v0}, Lu5;->k(Lgd0;Ljava/util/Set;)V

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    :goto_1
    new-instance v0, Ljava/lang/Exception;

    .line 77
    .line 78
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v3, "GoogleApiManager"

    .line 82
    .line 83
    const-string v4, "Received null response from onSignInSuccess"

    .line 84
    .line 85
    invoke-static {v3, v4, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 86
    .line 87
    .line 88
    new-instance v0, Loo;

    .line 89
    .line 90
    const/4 v3, 0x4

    .line 91
    invoke-direct {v0, v3, v2, v2}, Loo;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v0}, Lpl1;->a(Loo;)V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_4
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v2, Ljava/lang/Exception;

    .line 103
    .line 104
    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v3, "SignInCoordinator"

    .line 108
    .line 109
    const-string v4, "Sign-in succeeded with resolve account failure: "

    .line 110
    .line 111
    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v3, v0, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcm1;->i:Lpl1;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lpl1;->a(Loo;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcm1;->h:Ls71;

    .line 124
    .line 125
    invoke-virtual {p0}, Ljg;->n()V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_5
    iget-object v0, p0, Lcm1;->i:Lpl1;

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Lpl1;->a(Loo;)V

    .line 132
    .line 133
    .line 134
    :cond_6
    :goto_2
    iget-object p0, p0, Lcm1;->h:Ls71;

    .line 135
    .line 136
    invoke-virtual {p0}, Ljg;->n()V

    .line 137
    .line 138
    .line 139
    return-void
.end method
