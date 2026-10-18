.class public final Lz82;
.super Lfu1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Lo22;I)V
    .locals 0

    .line 1
    iput p3, p0, Lz82;->e:I

    .line 2
    .line 3
    iput-object p1, p0, Lz82;->f:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lfu1;-><init>(Lo22;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget v0, p0, Lz82;->e:I

    .line 2
    .line 3
    iget-object p0, p0, Lz82;->f:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lsa2;

    .line 9
    .line 10
    invoke-virtual {p0}, Lsa2;->c()Ls02;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ls02;->l()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lsa2;->z:Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lsa2;->f()Lmz;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    iput-wide v1, p0, Lsa2;->R:J

    .line 39
    .line 40
    invoke-virtual {p0}, Lsa2;->b()Lzy1;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v1, v1, Lzy1;->w:Lso;

    .line 45
    .line 46
    const-string v2, "Sending trigger URI notification to app"

    .line 47
    .line 48
    invoke-virtual {v1, v0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Landroid/content/Intent;

    .line 52
    .line 53
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v2, "com.google.android.gms.measurement.TRIGGERS_AVAILABLE"

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lsa2;->u:Ly02;

    .line 65
    .line 66
    iget-object v0, v0, Ly02;->j:Landroid/content/Context;

    .line 67
    .line 68
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 69
    .line 70
    const/16 v3, 0x22

    .line 71
    .line 72
    if-ge v2, v3, :cond_0

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    invoke-static {}, Lri0;->c()Landroid/app/BroadcastOptions;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-static {v2}, Lri0;->d(Landroid/app/BroadcastOptions;)Landroid/app/BroadcastOptions;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v2}, Lri0;->e(Landroid/app/BroadcastOptions;)Landroid/os/Bundle;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v0, v1, v2}, Lri0;->j(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lsa2;->H()V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :pswitch_0
    check-cast p0, Lq92;

    .line 98
    .line 99
    invoke-virtual {p0}, Lq92;->p()V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast v0, Ly02;

    .line 105
    .line 106
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 107
    .line 108
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 112
    .line 113
    const-string v1, "Starting upload from DelayedRunnable"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Ls92;->k:Lsa2;

    .line 119
    .line 120
    invoke-virtual {p0}, Lsa2;->q()V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :pswitch_1
    check-cast p0, Lf92;

    .line 125
    .line 126
    iget-object v0, p0, Lf92;->d:Lh92;

    .line 127
    .line 128
    invoke-virtual {v0}, Lgx1;->l()V

    .line 129
    .line 130
    .line 131
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 132
    .line 133
    check-cast v0, Ly02;

    .line 134
    .line 135
    iget-object v1, v0, Ly02;->t:Lmz;

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 141
    .line 142
    .line 143
    move-result-wide v1

    .line 144
    const/4 v3, 0x0

    .line 145
    invoke-virtual {p0, v3, v3, v1, v2}, Lf92;->a(ZZJ)Z

    .line 146
    .line 147
    .line 148
    iget-object p0, v0, Ly02;->w:Lfw1;

    .line 149
    .line 150
    invoke-static {p0}, Ly02;->i(Lgx1;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, v0, Ly02;->t:Lmz;

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 156
    .line 157
    .line 158
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 159
    .line 160
    .line 161
    move-result-wide v0

    .line 162
    invoke-virtual {p0, v0, v1}, Lfw1;->o(J)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    nop

    .line 167
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
