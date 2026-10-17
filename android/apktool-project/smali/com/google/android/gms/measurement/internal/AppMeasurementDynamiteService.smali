.class public Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;
.super Lsv1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public b:Ly02;

.field public final c:Lda;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "com.google.android.gms.measurement.api.internal.IAppMeasurementDynamiteService"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lvu1;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 8
    .line 9
    new-instance v0, Lda;

    .line 10
    .line 11
    invoke-direct {v0}, Lu71;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->c:Lda;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/String;Lvv1;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->r:Lcb2;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcb2;->Y(Ljava/lang/String;Lvv1;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "Attempting to perform action before initialize."

    .line 7
    .line 8
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public beginAdUnitExposure(Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->w:Lfw1;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->i(Lgx1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lfw1;->m(Ljava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public clearConditionalUserProperty(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lc52;->z(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public clearMeasurementEnabled(J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lay1;->m()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Let;->j:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ly02;

    .line 17
    .line 18
    iget-object p1, p1, Ly02;->p:Ls02;

    .line 19
    .line 20
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Lb42;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-direct {p2, p0, v0}, Lb42;-><init>(Lc52;Ljava/lang/Boolean;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public endAdUnitExposure(Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->w:Lfw1;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->i(Lgx1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lfw1;->n(Ljava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public generateEventId(Lvv1;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->r:Lcb2;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lcb2;->j0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 19
    .line 20
    iget-object p0, p0, Ly02;->r:Lcb2;

    .line 21
    .line 22
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1, v0, v1}, Lcb2;->Z(Lvv1;J)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public getAppInstanceId(Lvv1;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lu02;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lu02;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public getCachedAppInstanceId(Lvv1;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, v0, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->F(Ljava/lang/String;Lvv1;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public getConditionalUserProperties(Ljava/lang/String;Ljava/lang/String;Lvv1;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lv52;

    .line 12
    .line 13
    invoke-direct {v1, p0, p3, p1, p2}, Lv52;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public getCurrentScreenClass(Lvv1;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ly02;

    .line 14
    .line 15
    iget-object v0, v0, Ly02;->u:Lz52;

    .line 16
    .line 17
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, v0, Lz52;->l:Lm52;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, v0, Lm52;->b:Ljava/lang/String;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->F(Ljava/lang/String;Lvv1;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public getCurrentScreenName(Lvv1;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ly02;

    .line 14
    .line 15
    iget-object v0, v0, Ly02;->u:Lz52;

    .line 16
    .line 17
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, v0, Lz52;->l:Lm52;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, v0, Lm52;->a:Ljava/lang/String;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->F(Ljava/lang/String;Lvv1;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public getGmpAppId(Lvv1;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lc52;->A()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->F(Ljava/lang/String;Lvv1;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getMaxUserProperties(Ljava/lang/String;Lvv1;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lbh;->e(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, v0, Let;->j:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ly02;

    .line 17
    .line 18
    iget-object p1, p1, Ly02;->m:Lmt1;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 24
    .line 25
    iget-object p0, p0, Ly02;->r:Lcb2;

    .line 26
    .line 27
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 28
    .line 29
    .line 30
    const/16 p1, 0x19

    .line 31
    .line 32
    invoke-virtual {p0, p2, p1}, Lcb2;->a0(Lvv1;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public getSessionId(Lvv1;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ly02;

    .line 14
    .line 15
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 16
    .line 17
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lw32;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Lw32;-><init>(Lc52;Lvv1;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public getTestFlag(Lvv1;I)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_4

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-eq p2, v0, :cond_3

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-eq p2, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    if-eq p2, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-eq p2, v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 20
    .line 21
    iget-object p2, p2, Ly02;->r:Lcb2;

    .line 22
    .line 23
    invoke-static {p2}, Ly02;->j(Let;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 27
    .line 28
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 29
    .line 30
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v0, Ly02;

    .line 41
    .line 42
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 43
    .line 44
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 45
    .line 46
    .line 47
    new-instance v5, Lp32;

    .line 48
    .line 49
    invoke-direct {v5, p0, v1}, Lp32;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 50
    .line 51
    .line 52
    const-wide/16 v2, 0x3a98

    .line 53
    .line 54
    const-string v4, "boolean test flag value"

    .line 55
    .line 56
    invoke-virtual/range {v0 .. v5}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {p2, p1, p0}, Lcb2;->c0(Lvv1;Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 71
    .line 72
    iget-object p2, p2, Ly02;->r:Lcb2;

    .line 73
    .line 74
    invoke-static {p2}, Ly02;->j(Let;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 78
    .line 79
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 80
    .line 81
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 85
    .line 86
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast v0, Ly02;

    .line 92
    .line 93
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 94
    .line 95
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 96
    .line 97
    .line 98
    new-instance v5, Lz32;

    .line 99
    .line 100
    invoke-direct {v5, p0, v1}, Lz32;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 101
    .line 102
    .line 103
    const-wide/16 v2, 0x3a98

    .line 104
    .line 105
    const-string v4, "int test flag value"

    .line 106
    .line 107
    invoke-virtual/range {v0 .. v5}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Ljava/lang/Integer;

    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    invoke-virtual {p2, p1, p0}, Lcb2;->a0(Lvv1;I)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_2
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 122
    .line 123
    iget-object p2, p2, Ly02;->r:Lcb2;

    .line 124
    .line 125
    invoke-static {p2}, Ly02;->j(Let;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 129
    .line 130
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 131
    .line 132
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 133
    .line 134
    .line 135
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 136
    .line 137
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 141
    .line 142
    check-cast v0, Ly02;

    .line 143
    .line 144
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 145
    .line 146
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 147
    .line 148
    .line 149
    new-instance v5, La42;

    .line 150
    .line 151
    invoke-direct {v5, p0, v1}, La42;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 152
    .line 153
    .line 154
    const-wide/16 v2, 0x3a98

    .line 155
    .line 156
    const-string v4, "double test flag value"

    .line 157
    .line 158
    invoke-virtual/range {v0 .. v5}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    check-cast p0, Ljava/lang/Double;

    .line 163
    .line 164
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 165
    .line 166
    .line 167
    move-result-wide v0

    .line 168
    new-instance p0, Landroid/os/Bundle;

    .line 169
    .line 170
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 171
    .line 172
    .line 173
    const-string v2, "r"

    .line 174
    .line 175
    invoke-virtual {p0, v2, v0, v1}, Landroid/os/BaseBundle;->putDouble(Ljava/lang/String;D)V

    .line 176
    .line 177
    .line 178
    :try_start_0
    invoke-interface {p1, p0}, Lvv1;->l(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :catch_0
    move-exception v0

    .line 183
    move-object p0, v0

    .line 184
    iget-object p1, p2, Let;->j:Ljava/lang/Object;

    .line 185
    .line 186
    check-cast p1, Ly02;

    .line 187
    .line 188
    iget-object p1, p1, Ly02;->o:Lzy1;

    .line 189
    .line 190
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 191
    .line 192
    .line 193
    iget-object p1, p1, Lzy1;->r:Lso;

    .line 194
    .line 195
    const-string p2, "Error returning double value to wrapper"

    .line 196
    .line 197
    invoke-virtual {p1, p0, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :cond_3
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 202
    .line 203
    iget-object p2, p2, Ly02;->r:Lcb2;

    .line 204
    .line 205
    invoke-static {p2}, Ly02;->j(Let;)V

    .line 206
    .line 207
    .line 208
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 209
    .line 210
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 211
    .line 212
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 213
    .line 214
    .line 215
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 216
    .line 217
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v0, Ly02;

    .line 223
    .line 224
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 225
    .line 226
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 227
    .line 228
    .line 229
    new-instance v5, Ly32;

    .line 230
    .line 231
    invoke-direct {v5, p0, v1}, Ly32;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 232
    .line 233
    .line 234
    const-wide/16 v2, 0x3a98

    .line 235
    .line 236
    const-string v4, "long test flag value"

    .line 237
    .line 238
    invoke-virtual/range {v0 .. v5}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    check-cast p0, Ljava/lang/Long;

    .line 243
    .line 244
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 245
    .line 246
    .line 247
    move-result-wide v0

    .line 248
    invoke-virtual {p2, p1, v0, v1}, Lcb2;->Z(Lvv1;J)V

    .line 249
    .line 250
    .line 251
    return-void

    .line 252
    :cond_4
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 253
    .line 254
    iget-object p2, p2, Ly02;->r:Lcb2;

    .line 255
    .line 256
    invoke-static {p2}, Ly02;->j(Let;)V

    .line 257
    .line 258
    .line 259
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 260
    .line 261
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 262
    .line 263
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 264
    .line 265
    .line 266
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 267
    .line 268
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 272
    .line 273
    check-cast v0, Ly02;

    .line 274
    .line 275
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 276
    .line 277
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 278
    .line 279
    .line 280
    new-instance v5, Lx32;

    .line 281
    .line 282
    invoke-direct {v5, p0, v1}, Lx32;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 283
    .line 284
    .line 285
    const-wide/16 v2, 0x3a98

    .line 286
    .line 287
    const-string v4, "String test flag value"

    .line 288
    .line 289
    invoke-virtual/range {v0 .. v5}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    check-cast p0, Ljava/lang/String;

    .line 294
    .line 295
    invoke-virtual {p2, p0, p1}, Lcb2;->Y(Ljava/lang/String;Lvv1;)V

    .line 296
    .line 297
    .line 298
    return-void
.end method

.method public getUserProperties(Ljava/lang/String;Ljava/lang/String;ZLvv1;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lj32;

    .line 12
    .line 13
    move-object v2, p0

    .line 14
    move-object v4, p1

    .line 15
    move-object v5, p2

    .line 16
    move v6, p3

    .line 17
    move-object v3, p4

    .line 18
    invoke-direct/range {v1 .. v6}, Lj32;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public initForTests(Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initialize(Lid0;Llw1;J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    const/4 p4, 0x0

    .line 19
    invoke-static {p1, p2, p3, p4}, Ly02;->q(Landroid/content/Context;Llw1;Ljava/lang/Long;Ljava/lang/Long;)Ly02;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 27
    .line 28
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 32
    .line 33
    const-string p1, "Attempting to initialize multiple times"

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public initializeWithElapsedTime(Lid0;Llw1;JJ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object p4

    .line 22
    invoke-static {p1, p2, p3, p4}, Ly02;->q(Landroid/content/Context;Llw1;Ljava/lang/Long;Ljava/lang/Long;)Ly02;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 30
    .line 31
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 35
    .line 36
    const-string p1, "Attempting to initialize multiple times"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public isDataCollectionEnabled(Lvv1;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lp72;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lp72;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public logEvent(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJ)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v8, 0x0

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    move-object v2, p2

    .line 15
    move-object v3, p3

    .line 16
    move v4, p4

    .line 17
    move v5, p5

    .line 18
    move-wide/from16 v6, p6

    .line 19
    .line 20
    invoke-virtual/range {v0 .. v9}, Lc52;->q(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJJ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public logEventAndBundle(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Lvv1;J)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lbh;->e(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 8
    .line 9
    iget-object v0, v0, Ly02;->m:Lmt1;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    sget-object v2, Lxx1;->f1:Lwx1;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-eq v1, v0, :cond_0

    .line 20
    .line 21
    const-string v0, "app"

    .line 22
    .line 23
    :goto_0
    move-object v4, v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const-string v0, "auto"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    if-eqz p3, :cond_1

    .line 29
    .line 30
    new-instance v0, Landroid/os/Bundle;

    .line 31
    .line 32
    invoke-direct {v0, p3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    .line 37
    .line 38
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 39
    .line 40
    .line 41
    :goto_2
    const-string v1, "_o"

    .line 42
    .line 43
    invoke-virtual {v0, v1, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Ltu1;

    .line 47
    .line 48
    new-instance v3, Lsu1;

    .line 49
    .line 50
    invoke-direct {v3, p3}, Lsu1;-><init>(Landroid/os/Bundle;)V

    .line 51
    .line 52
    .line 53
    const-wide/16 v7, 0x0

    .line 54
    .line 55
    move-object v2, p2

    .line 56
    move-wide v5, p5

    .line 57
    invoke-direct/range {v1 .. v8}, Ltu1;-><init>(Ljava/lang/String;Lsu1;Ljava/lang/String;JJ)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 61
    .line 62
    iget-object p2, p2, Ly02;->p:Ls02;

    .line 63
    .line 64
    invoke-static {p2}, Ly02;->l(Lm22;)V

    .line 65
    .line 66
    .line 67
    new-instance p3, Le22;

    .line 68
    .line 69
    invoke-direct {p3, p0, p4, v1, p1}, Le22;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;Ltu1;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2, p3}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public logEventWithElapsedTime(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJJ)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    move-object v1, p1

    .line 12
    move-object v2, p2

    .line 13
    move-object v3, p3

    .line 14
    move v4, p4

    .line 15
    move v5, p5

    .line 16
    move-wide/from16 v6, p6

    .line 17
    .line 18
    move-wide/from16 v8, p8

    .line 19
    .line 20
    invoke-virtual/range {v0 .. v9}, Lc52;->q(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJJ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public logHealthData(ILjava/lang/String;Lid0;Lid0;Lid0;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    move-object v6, v0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {p3}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    move-object v6, p3

    .line 14
    :goto_0
    if-nez p4, :cond_1

    .line 15
    .line 16
    move-object v7, v0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    invoke-static {p4}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    move-object v7, p3

    .line 23
    :goto_1
    if-nez p5, :cond_2

    .line 24
    .line 25
    :goto_2
    move-object v8, v0

    .line 26
    goto :goto_3

    .line 27
    :cond_2
    invoke-static {p5}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    goto :goto_2

    .line 32
    :goto_3
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 33
    .line 34
    iget-object v1, p0, Ly02;->o:Lzy1;

    .line 35
    .line 36
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 37
    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    const/4 v4, 0x0

    .line 41
    move v2, p1

    .line 42
    move-object v5, p2

    .line 43
    invoke-virtual/range {v1 .. v8}, Lzy1;->q(IZZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onActivityCreated(Lid0;Landroid/os/Bundle;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->onActivityCreatedByScionActivityInfo(Lmw1;Landroid/os/Bundle;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onActivityCreatedByScionActivityInfo(Lmw1;Landroid/os/Bundle;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p3, p3, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p3}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p3, Lc52;->l:Lcx1;

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 16
    .line 17
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 18
    .line 19
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lc52;->E()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p3, p1, p2}, Lcx1;->c(Lmw1;Landroid/os/Bundle;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public onActivityDestroyed(Lid0;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->onActivityDestroyedByScionActivityInfo(Lmw1;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onActivityDestroyedByScionActivityInfo(Lmw1;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p2, p2, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p2}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p2, Lc52;->l:Lcx1;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 16
    .line 17
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 18
    .line 19
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lc52;->E()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Lcx1;->d(Lmw1;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public onActivityPaused(Lid0;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->onActivityPausedByScionActivityInfo(Lmw1;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onActivityPausedByScionActivityInfo(Lmw1;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p2, p2, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p2}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p2, Lc52;->l:Lcx1;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 16
    .line 17
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 18
    .line 19
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lc52;->E()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Lcx1;->e(Lmw1;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public onActivityResumed(Lid0;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->onActivityResumedByScionActivityInfo(Lmw1;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onActivityResumedByScionActivityInfo(Lmw1;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p2, p2, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p2}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p2, Lc52;->l:Lcx1;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 16
    .line 17
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 18
    .line 19
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lc52;->E()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Lcx1;->f(Lmw1;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public onActivitySaveInstanceState(Lid0;Lvv1;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->onActivitySaveInstanceStateByScionActivityInfo(Lmw1;Lvv1;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onActivitySaveInstanceStateByScionActivityInfo(Lmw1;Lvv1;J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p3, p3, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p3}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p3, Lc52;->l:Lcx1;

    .line 12
    .line 13
    new-instance p4, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {p4}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 21
    .line 22
    iget-object v0, v0, Ly02;->v:Lc52;

    .line 23
    .line 24
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lc52;->E()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3, p1, p4}, Lcx1;->g(Lmw1;Landroid/os/Bundle;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    :try_start_0
    invoke-interface {p2, p4}, Lvv1;->l(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p1

    .line 38
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 39
    .line 40
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 41
    .line 42
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 46
    .line 47
    const-string p2, "Error returning bundle value to wrapper"

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public onActivityStarted(Lid0;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->onActivityStartedByScionActivityInfo(Lmw1;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onActivityStartedByScionActivityInfo(Lmw1;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p1, p1, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p1}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p1, Lc52;->l:Lcx1;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 16
    .line 17
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 18
    .line 19
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lc52;->E()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onActivityStopped(Lid0;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->onActivityStoppedByScionActivityInfo(Lmw1;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onActivityStoppedByScionActivityInfo(Lmw1;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p1, p1, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p1}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p1, Lc52;->l:Lcx1;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 16
    .line 17
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 18
    .line 19
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lc52;->E()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public performAction(Landroid/os/Bundle;Lvv1;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-interface {p2, p0}, Lvv1;->l(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public registerOnMeasurementEventListener(Lzv1;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->c:Lda;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    invoke-interface {p1}, Lzv1;->d()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, v2}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lx22;

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    new-instance v1, Lkb2;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lkb2;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lzv1;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p1}, Lzv1;->d()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v0, p1, v1}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 45
    .line 46
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 47
    .line 48
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lay1;->m()V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lc52;->n:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast p0, Ly02;

    .line 65
    .line 66
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 67
    .line 68
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 72
    .line 73
    const-string p1, "OnEventListener already registered"

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void

    .line 79
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p0
.end method

.method public resetAnalyticsData(J)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ly02;

    .line 20
    .line 21
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 22
    .line 23
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Lq32;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1, p2}, Lq32;-><init>(Lc52;J)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public resetAnalyticsDataWithElapsedTime(JJ)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p0, Lc52;->p:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    const/4 p4, 0x0

    .line 14
    invoke-virtual {p3, p4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p3, p0, Let;->j:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p3, Ly02;

    .line 20
    .line 21
    iget-object p3, p3, Ly02;->p:Ls02;

    .line 22
    .line 23
    invoke-static {p3}, Ly02;->l(Lm22;)V

    .line 24
    .line 25
    .line 26
    new-instance p4, Lq32;

    .line 27
    .line 28
    invoke-direct {p4, p0, p1, p2}, Lq32;-><init>(Lc52;J)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p3, p4}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public retrieveAndUploadBatches(Lxv1;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 7
    .line 8
    iget-object v1, v1, Ly02;->v:Lc52;

    .line 9
    .line 10
    invoke-static {v1}, Ly02;->k(Lay1;)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Lc92;

    .line 14
    .line 15
    move-object/from16 v3, p1

    .line 16
    .line 17
    invoke-direct {v2, v0, v3}, Lc92;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lxv1;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Lay1;->m()V

    .line 21
    .line 22
    .line 23
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 24
    .line 25
    move-object v3, v0

    .line 26
    check-cast v3, Ly02;

    .line 27
    .line 28
    iget-object v0, v3, Ly02;->p:Ls02;

    .line 29
    .line 30
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ls02;->r()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_c

    .line 38
    .line 39
    iget-object v0, v3, Ly02;->p:Ls02;

    .line 40
    .line 41
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object v0, v0, Ls02;->m:Lq02;

    .line 49
    .line 50
    if-ne v4, v0, :cond_0

    .line 51
    .line 52
    iget-object v0, v3, Ly02;->o:Lzy1;

    .line 53
    .line 54
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 58
    .line 59
    const-string v1, "Cannot retrieve and upload batches from analytics network thread"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    invoke-static {}, Ltb0;->m()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object v4, v3, Ly02;->o:Lzy1;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, v4, Lzy1;->w:Lso;

    .line 77
    .line 78
    const-string v4, "[sgtm] Started client-side batch upload work."

    .line 79
    .line 80
    invoke-virtual {v0, v4}, Lso;->b(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    const/4 v0, 0x0

    .line 84
    const/4 v5, 0x0

    .line 85
    const/4 v6, 0x0

    .line 86
    :goto_0
    if-nez v0, :cond_a

    .line 87
    .line 88
    iget-object v0, v3, Ly02;->o:Lzy1;

    .line 89
    .line 90
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 94
    .line 95
    const-string v7, "[sgtm] Getting upload batches from service (FE)"

    .line 96
    .line 97
    invoke-virtual {v0, v7}, Lso;->b(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance v9, Ljava/util/concurrent/atomic/AtomicReference;

    .line 101
    .line 102
    invoke-direct {v9}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 103
    .line 104
    .line 105
    iget-object v8, v3, Ly02;->p:Ls02;

    .line 106
    .line 107
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 108
    .line 109
    .line 110
    new-instance v13, Lb52;

    .line 111
    .line 112
    invoke-direct {v13, v1, v9}, Lb52;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 113
    .line 114
    .line 115
    const-wide/16 v10, 0x2710

    .line 116
    .line 117
    const-string v12, "[sgtm] Getting upload batches"

    .line 118
    .line 119
    invoke-virtual/range {v8 .. v13}, Ls02;->v(Ljava/util/concurrent/atomic/AtomicReference;JLjava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Ly92;

    .line 127
    .line 128
    if-eqz v0, :cond_a

    .line 129
    .line 130
    iget-object v0, v0, Ly92;->j:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v7

    .line 136
    if-eqz v7, :cond_1

    .line 137
    .line 138
    goto/16 :goto_8

    .line 139
    .line 140
    :cond_1
    iget-object v7, v3, Ly02;->o:Lzy1;

    .line 141
    .line 142
    invoke-static {v7}, Ly02;->l(Lm22;)V

    .line 143
    .line 144
    .line 145
    iget-object v7, v7, Lzy1;->w:Lso;

    .line 146
    .line 147
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 148
    .line 149
    .line 150
    move-result v8

    .line 151
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v8

    .line 155
    const-string v9, "[sgtm] Retrieved upload batches. count"

    .line 156
    .line 157
    invoke-virtual {v7, v8, v9}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    add-int/2addr v5, v7

    .line 165
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    :cond_2
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_9

    .line 174
    .line 175
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    move-object v8, v0

    .line 180
    check-cast v8, Lt92;

    .line 181
    .line 182
    :try_start_0
    new-instance v0, Ljava/net/URI;

    .line 183
    .line 184
    iget-object v9, v8, Lt92;->l:Ljava/lang/String;

    .line 185
    .line 186
    invoke-direct {v0, v9}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    .line 190
    .line 191
    .line 192
    move-result-object v13
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 193
    new-instance v9, Ljava/util/concurrent/atomic/AtomicReference;

    .line 194
    .line 195
    invoke-direct {v9}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 196
    .line 197
    .line 198
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 199
    .line 200
    check-cast v0, Ly02;

    .line 201
    .line 202
    invoke-virtual {v0}, Ly02;->p()Lky1;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0}, Lay1;->m()V

    .line 207
    .line 208
    .line 209
    iget-object v10, v0, Lky1;->p:Ljava/lang/String;

    .line 210
    .line 211
    invoke-static {v10}, Lbh;->h(Ljava/lang/Object;)V

    .line 212
    .line 213
    .line 214
    iget-object v12, v0, Lky1;->p:Ljava/lang/String;

    .line 215
    .line 216
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 217
    .line 218
    check-cast v0, Ly02;

    .line 219
    .line 220
    iget-object v10, v0, Ly02;->o:Lzy1;

    .line 221
    .line 222
    invoke-static {v10}, Ly02;->l(Lm22;)V

    .line 223
    .line 224
    .line 225
    iget-object v10, v10, Lzy1;->w:Lso;

    .line 226
    .line 227
    iget-wide v14, v8, Lt92;->j:J

    .line 228
    .line 229
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 230
    .line 231
    .line 232
    move-result-object v11

    .line 233
    iget-object v14, v8, Lt92;->l:Ljava/lang/String;

    .line 234
    .line 235
    iget-object v15, v8, Lt92;->k:[B

    .line 236
    .line 237
    array-length v15, v15

    .line 238
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 239
    .line 240
    .line 241
    move-result-object v15

    .line 242
    const-string v4, "[sgtm] Uploading data from app. row_id, url, uncompressed size"

    .line 243
    .line 244
    invoke-virtual {v10, v4, v11, v14, v15}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    iget-object v4, v8, Lt92;->p:Ljava/lang/String;

    .line 248
    .line 249
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 250
    .line 251
    .line 252
    move-result v4

    .line 253
    if-nez v4, :cond_3

    .line 254
    .line 255
    iget-object v4, v0, Ly02;->o:Lzy1;

    .line 256
    .line 257
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 258
    .line 259
    .line 260
    iget-object v4, v4, Lzy1;->w:Lso;

    .line 261
    .line 262
    iget-object v10, v8, Lt92;->p:Ljava/lang/String;

    .line 263
    .line 264
    const-string v14, "[sgtm] Uploading data from app. row_id"

    .line 265
    .line 266
    invoke-virtual {v4, v14, v11, v10}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    :cond_3
    new-instance v15, Ljava/util/HashMap;

    .line 270
    .line 271
    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 272
    .line 273
    .line 274
    iget-object v4, v8, Lt92;->m:Landroid/os/Bundle;

    .line 275
    .line 276
    invoke-virtual {v4}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 277
    .line 278
    .line 279
    move-result-object v10

    .line 280
    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 281
    .line 282
    .line 283
    move-result-object v10

    .line 284
    :cond_4
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 285
    .line 286
    .line 287
    move-result v11

    .line 288
    if-eqz v11, :cond_5

    .line 289
    .line 290
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v11

    .line 294
    check-cast v11, Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {v4, v11}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v14

    .line 300
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 301
    .line 302
    .line 303
    move-result v16

    .line 304
    if-nez v16, :cond_4

    .line 305
    .line 306
    invoke-virtual {v15, v11, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    goto :goto_2

    .line 310
    :cond_5
    iget-object v11, v0, Ly02;->x:Li52;

    .line 311
    .line 312
    invoke-static {v11}, Ly02;->l(Lm22;)V

    .line 313
    .line 314
    .line 315
    iget-object v14, v8, Lt92;->k:[B

    .line 316
    .line 317
    new-instance v4, Ll42;

    .line 318
    .line 319
    invoke-direct {v4, v1, v9, v8}, Ll42;-><init>(Lc52;Ljava/util/concurrent/atomic/AtomicReference;Lt92;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v11}, Lm22;->n()V

    .line 323
    .line 324
    .line 325
    invoke-static {v13}, Lbh;->h(Ljava/lang/Object;)V

    .line 326
    .line 327
    .line 328
    invoke-static {v14}, Lbh;->h(Ljava/lang/Object;)V

    .line 329
    .line 330
    .line 331
    iget-object v8, v11, Let;->j:Ljava/lang/Object;

    .line 332
    .line 333
    check-cast v8, Ly02;

    .line 334
    .line 335
    iget-object v8, v8, Ly02;->p:Ls02;

    .line 336
    .line 337
    invoke-static {v8}, Ly02;->l(Lm22;)V

    .line 338
    .line 339
    .line 340
    new-instance v10, Lh52;

    .line 341
    .line 342
    move-object/from16 v16, v4

    .line 343
    .line 344
    invoke-direct/range {v10 .. v16}, Lh52;-><init>(Li52;Ljava/lang/String;Ljava/net/URL;[BLjava/util/HashMap;Lf52;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v8, v10}, Ls02;->x(Ljava/lang/Runnable;)V

    .line 348
    .line 349
    .line 350
    :try_start_1
    iget-object v0, v0, Ly02;->r:Lcb2;

    .line 351
    .line 352
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 353
    .line 354
    .line 355
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 356
    .line 357
    check-cast v0, Ly02;

    .line 358
    .line 359
    iget-object v4, v0, Ly02;->t:Lmz;

    .line 360
    .line 361
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 362
    .line 363
    .line 364
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 365
    .line 366
    .line 367
    move-result-wide v10

    .line 368
    const-wide/32 v12, 0xea60

    .line 369
    .line 370
    .line 371
    add-long/2addr v10, v12

    .line 372
    monitor-enter v9
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 373
    :goto_3
    :try_start_2
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v4

    .line 377
    if-nez v4, :cond_6

    .line 378
    .line 379
    const-wide/16 v14, 0x0

    .line 380
    .line 381
    cmp-long v4, v12, v14

    .line 382
    .line 383
    if-lez v4, :cond_6

    .line 384
    .line 385
    invoke-virtual {v9, v12, v13}, Ljava/lang/Object;->wait(J)V

    .line 386
    .line 387
    .line 388
    iget-object v4, v0, Ly02;->t:Lmz;

    .line 389
    .line 390
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 391
    .line 392
    .line 393
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 394
    .line 395
    .line 396
    move-result-wide v12

    .line 397
    sub-long v12, v10, v12

    .line 398
    .line 399
    goto :goto_3

    .line 400
    :catchall_0
    move-exception v0

    .line 401
    goto :goto_4

    .line 402
    :cond_6
    monitor-exit v9

    .line 403
    goto :goto_5

    .line 404
    :goto_4
    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 405
    :try_start_3
    throw v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 406
    :catch_0
    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    .line 407
    .line 408
    check-cast v0, Ly02;

    .line 409
    .line 410
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 411
    .line 412
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 413
    .line 414
    .line 415
    iget-object v0, v0, Lzy1;->r:Lso;

    .line 416
    .line 417
    const-string v4, "[sgtm] Interrupted waiting for uploading batch"

    .line 418
    .line 419
    invoke-virtual {v0, v4}, Lso;->b(Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    :goto_5
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    if-nez v0, :cond_7

    .line 427
    .line 428
    sget-object v0, Lk52;->k:Lk52;

    .line 429
    .line 430
    goto :goto_7

    .line 431
    :cond_7
    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    check-cast v0, Lk52;

    .line 436
    .line 437
    goto :goto_7

    .line 438
    :catch_1
    move-exception v0

    .line 439
    goto :goto_6

    .line 440
    :catch_2
    move-exception v0

    .line 441
    :goto_6
    iget-object v4, v1, Let;->j:Ljava/lang/Object;

    .line 442
    .line 443
    check-cast v4, Ly02;

    .line 444
    .line 445
    iget-object v4, v4, Ly02;->o:Lzy1;

    .line 446
    .line 447
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 448
    .line 449
    .line 450
    iget-object v4, v4, Lzy1;->o:Lso;

    .line 451
    .line 452
    iget-object v9, v8, Lt92;->l:Ljava/lang/String;

    .line 453
    .line 454
    iget-wide v10, v8, Lt92;->j:J

    .line 455
    .line 456
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 457
    .line 458
    .line 459
    move-result-object v8

    .line 460
    const-string v10, "[sgtm] Bad upload url for row_id"

    .line 461
    .line 462
    invoke-virtual {v4, v10, v9, v8, v0}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 463
    .line 464
    .line 465
    sget-object v0, Lk52;->m:Lk52;

    .line 466
    .line 467
    :goto_7
    sget-object v4, Lk52;->l:Lk52;

    .line 468
    .line 469
    if-ne v0, v4, :cond_8

    .line 470
    .line 471
    add-int/lit8 v6, v6, 0x1

    .line 472
    .line 473
    goto/16 :goto_1

    .line 474
    .line 475
    :cond_8
    sget-object v4, Lk52;->n:Lk52;

    .line 476
    .line 477
    if-ne v0, v4, :cond_2

    .line 478
    .line 479
    const/4 v0, 0x1

    .line 480
    goto/16 :goto_0

    .line 481
    .line 482
    :cond_9
    const/4 v0, 0x0

    .line 483
    goto/16 :goto_0

    .line 484
    .line 485
    :cond_a
    :goto_8
    iget-object v0, v3, Ly02;->o:Lzy1;

    .line 486
    .line 487
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 488
    .line 489
    .line 490
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 491
    .line 492
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 493
    .line 494
    .line 495
    move-result-object v1

    .line 496
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 497
    .line 498
    .line 499
    move-result-object v3

    .line 500
    const-string v4, "[sgtm] Completed client-side batch upload work. total, success"

    .line 501
    .line 502
    invoke-virtual {v0, v4, v1, v3}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 503
    .line 504
    .line 505
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 506
    .line 507
    .line 508
    return-void

    .line 509
    :cond_b
    invoke-static {v4}, Ly02;->l(Lm22;)V

    .line 510
    .line 511
    .line 512
    iget-object v0, v4, Lzy1;->o:Lso;

    .line 513
    .line 514
    const-string v1, "Cannot retrieve and upload batches from main thread"

    .line 515
    .line 516
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    return-void

    .line 520
    :cond_c
    iget-object v0, v3, Ly02;->o:Lzy1;

    .line 521
    .line 522
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 523
    .line 524
    .line 525
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 526
    .line 527
    const-string v1, "Cannot retrieve and upload batches from analytics worker thread"

    .line 528
    .line 529
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 530
    .line 531
    .line 532
    return-void
.end method

.method public setConditionalUserProperty(Landroid/os/Bundle;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 9
    .line 10
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 14
    .line 15
    const-string p1, "Conditional user property must not be null"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 22
    .line 23
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, p2, p3}, Lc52;->y(Landroid/os/Bundle;J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setConsent(Landroid/os/Bundle;J)V
    .locals 0

    .line 1
    return-void
.end method

.method public setConsentThirdParty(Landroid/os/Bundle;J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    const/16 v0, -0x14

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0, p2, p3}, Lc52;->F(Landroid/os/Bundle;IJ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setCurrentScreen(Lid0;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lmw1;->b(Landroid/app/Activity;)Lmw1;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    move-object v0, p0

    .line 18
    move-object v2, p2

    .line 19
    move-object v3, p3

    .line 20
    move-wide v4, p4

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->setCurrentScreenByScionActivityInfo(Lmw1;Ljava/lang/String;Ljava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setCurrentScreenByScionActivityInfo(Lmw1;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->u:Lz52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p4, p0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p4, Ly02;

    .line 14
    .line 15
    iget-object p5, p4, Ly02;->m:Lmt1;

    .line 16
    .line 17
    invoke-virtual {p5}, Lmt1;->A()Z

    .line 18
    .line 19
    .line 20
    move-result p5

    .line 21
    if-nez p5, :cond_0

    .line 22
    .line 23
    iget-object p0, p4, Ly02;->o:Lzy1;

    .line 24
    .line 25
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lzy1;->t:Lso;

    .line 29
    .line 30
    const-string p1, "setCurrentScreen cannot be called while screen reporting is disabled."

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p5, p0, Lz52;->l:Lm52;

    .line 37
    .line 38
    if-nez p5, :cond_1

    .line 39
    .line 40
    iget-object p0, p4, Ly02;->o:Lzy1;

    .line 41
    .line 42
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lzy1;->t:Lso;

    .line 46
    .line 47
    const-string p1, "setCurrentScreen cannot be called while no activity active"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object v0, p0, Lz52;->o:Ljava/util/concurrent/ConcurrentHashMap;

    .line 54
    .line 55
    iget v1, p1, Lmw1;->j:I

    .line 56
    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    iget-object p0, p4, Ly02;->o:Lzy1;

    .line 68
    .line 69
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lzy1;->t:Lso;

    .line 73
    .line 74
    const-string p1, "setCurrentScreen must be called with an activity in the activity lifecycle"

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    if-nez p3, :cond_3

    .line 81
    .line 82
    iget-object p3, p1, Lmw1;->k:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0, p3}, Lz52;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    :cond_3
    iget-object v2, p5, Lm52;->b:Ljava/lang/String;

    .line 89
    .line 90
    iget-object p5, p5, Lm52;->a:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v2, p3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-static {p5, p2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p5

    .line 100
    if-eqz v2, :cond_4

    .line 101
    .line 102
    if-eqz p5, :cond_4

    .line 103
    .line 104
    iget-object p0, p4, Ly02;->o:Lzy1;

    .line 105
    .line 106
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lzy1;->t:Lso;

    .line 110
    .line 111
    const-string p1, "setCurrentScreen cannot be called with the same class and name"

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    const/16 p5, 0x1f4

    .line 118
    .line 119
    if-eqz p2, :cond_6

    .line 120
    .line 121
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-lez v2, :cond_5

    .line 126
    .line 127
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    iget-object v3, p4, Ly02;->m:Lmt1;

    .line 132
    .line 133
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    if-le v2, p5, :cond_6

    .line 137
    .line 138
    :cond_5
    iget-object p0, p4, Ly02;->o:Lzy1;

    .line 139
    .line 140
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Lzy1;->t:Lso;

    .line 144
    .line 145
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    const-string p2, "Invalid screen name length in setCurrentScreen. Length"

    .line 150
    .line 151
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p0, p1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_6
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-lez v2, :cond_9

    .line 164
    .line 165
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    iget-object v3, p4, Ly02;->m:Lmt1;

    .line 170
    .line 171
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 172
    .line 173
    .line 174
    if-le v2, p5, :cond_7

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_7
    iget-object p5, p4, Ly02;->o:Lzy1;

    .line 178
    .line 179
    invoke-static {p5}, Ly02;->l(Lm22;)V

    .line 180
    .line 181
    .line 182
    iget-object p5, p5, Lzy1;->w:Lso;

    .line 183
    .line 184
    if-nez p2, :cond_8

    .line 185
    .line 186
    const-string v2, "null"

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_8
    move-object v2, p2

    .line 190
    :goto_0
    const-string v3, "Setting current screen to name, class"

    .line 191
    .line 192
    invoke-virtual {p5, v3, v2, p3}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    new-instance p5, Lm52;

    .line 196
    .line 197
    iget-object p4, p4, Ly02;->r:Lcb2;

    .line 198
    .line 199
    invoke-static {p4}, Ly02;->j(Let;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p4}, Lcb2;->j0()J

    .line 203
    .line 204
    .line 205
    move-result-wide v2

    .line 206
    invoke-direct {p5, p2, p3, v2, v3}, Lm52;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, v1, p5}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    iget-object p1, p1, Lmw1;->k:Ljava/lang/String;

    .line 213
    .line 214
    const/4 p2, 0x1

    .line 215
    invoke-virtual {p0, p1, p5, p2}, Lz52;->t(Ljava/lang/String;Lm52;Z)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_9
    :goto_1
    iget-object p0, p4, Ly02;->o:Lzy1;

    .line 220
    .line 221
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 222
    .line 223
    .line 224
    iget-object p0, p0, Lzy1;->t:Lso;

    .line 225
    .line 226
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    const-string p2, "Invalid class name length in setCurrentScreen. Length"

    .line 231
    .line 232
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    invoke-virtual {p0, p1, p2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public setDataCollectionEnabled(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lay1;->m()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ly02;

    .line 17
    .line 18
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 19
    .line 20
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lf32;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Lf32;-><init>(Lc52;Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setDefaultEventParameters(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 22
    .line 23
    .line 24
    move-object p1, v0

    .line 25
    :goto_0
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Ly02;

    .line 28
    .line 29
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 30
    .line 31
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Lx42;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Lx42;-><init>(Lc52;Landroid/os/Bundle;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public setEventInterceptor(Lzv1;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lka2;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p0, v0, Lka2;->b:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, v0, Lka2;->a:Ljava/lang/Object;

    .line 12
    .line 13
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 14
    .line 15
    iget-object p1, p1, Ly02;->p:Ls02;

    .line 16
    .line 17
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ls02;->r()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 25
    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    iget-object p0, v1, Ly02;->v:Lc52;

    .line 29
    .line 30
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lgx1;->l()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lay1;->m()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lc52;->m:Lka2;

    .line 40
    .line 41
    if-eq v0, p1, :cond_1

    .line 42
    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 p1, 0x0

    .line 48
    :goto_0
    const-string v1, "EventInterceptor already set."

    .line 49
    .line 50
    invoke-static {v1, p1}, Lbh;->j(Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iput-object v0, p0, Lc52;->m:Lka2;

    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    iget-object p1, v1, Ly02;->p:Ls02;

    .line 57
    .line 58
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 59
    .line 60
    .line 61
    new-instance v1, Lo42;

    .line 62
    .line 63
    invoke-direct {v1, p0, v0}, Lo42;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lka2;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public setInstanceIdProvider(Lkw1;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMeasurementEnabled(ZJ)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Lay1;->m()V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Let;->j:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p2, Ly02;

    .line 21
    .line 22
    iget-object p2, p2, Ly02;->p:Ls02;

    .line 23
    .line 24
    invoke-static {p2}, Ly02;->l(Lm22;)V

    .line 25
    .line 26
    .line 27
    new-instance p3, Lb42;

    .line 28
    .line 29
    invoke-direct {p3, p0, p1}, Lb42;-><init>(Lc52;Ljava/lang/Boolean;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, p3}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setMinimumSessionDuration(J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setSessionTimeoutDuration(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ly02;

    .line 14
    .line 15
    iget-object v0, v0, Ly02;->p:Ls02;

    .line 16
    .line 17
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lm32;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2}, Lm32;-><init>(Lc52;J)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setSgtmDebugInfo(Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ly02;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 22
    .line 23
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lzy1;->u:Lso;

    .line 27
    .line 28
    const-string p1, "Activity intent has no data. Preview Mode was not enabled."

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string v0, "sgtm_debug_enable"

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const-string v1, "1"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-string v0, "sgtm_preview_key"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Ly02;->o:Lzy1;

    .line 64
    .line 65
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, v0, Lzy1;->u:Lso;

    .line 69
    .line 70
    const-string v1, "[sgtm] Preview Mode was enabled. Using the sgtmPreviewKey: "

    .line 71
    .line 72
    invoke-virtual {v0, p1, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ly02;->m:Lmt1;

    .line 76
    .line 77
    iput-object p1, p0, Lmt1;->l:Ljava/lang/String;

    .line 78
    .line 79
    :cond_2
    return-void

    .line 80
    :cond_3
    :goto_0
    iget-object p1, p0, Ly02;->o:Lzy1;

    .line 81
    .line 82
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p1, Lzy1;->u:Lso;

    .line 86
    .line 87
    const-string v0, "[sgtm] Preview Mode was not enabled."

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lso;->b(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ly02;->m:Lmt1;

    .line 93
    .line 94
    const/4 p1, 0x0

    .line 95
    iput-object p1, p0, Lmt1;->l:Ljava/lang/String;

    .line 96
    .line 97
    return-void
.end method

.method public setUserId(Ljava/lang/String;J)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 5
    .line 6
    iget-object v0, p0, Ly02;->v:Lc52;

    .line 7
    .line 8
    invoke-static {v0}, Ly02;->k(Lay1;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, v0, Let;->j:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ly02;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 24
    .line 25
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 29
    .line 30
    const-string p1, "User ID must be non-empty or null"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p0, p0, Ly02;->p:Ls02;

    .line 37
    .line 38
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ly42;

    .line 42
    .line 43
    invoke-direct {v1, v0, p1}, Ly42;-><init>(Lc52;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v1}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    const-string v2, "_id"

    .line 50
    .line 51
    const/4 v4, 0x1

    .line 52
    const/4 v1, 0x0

    .line 53
    move-object v3, p1

    .line 54
    move-wide v5, p2

    .line 55
    invoke-virtual/range {v0 .. v6}, Lc52;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZJ)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public setUserProperty(Ljava/lang/String;Ljava/lang/String;Lid0;ZJ)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Lkr0;->H(Lid0;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 9
    .line 10
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 11
    .line 12
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual/range {p0 .. p6}, Lc52;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZJ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public unregisterOnMeasurementEventListener(Lzv1;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->c:Lda;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    invoke-interface {p1}, Lzv1;->d()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lx22;

    .line 20
    .line 21
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    new-instance v1, Lkb2;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lkb2;-><init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lzv1;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 30
    .line 31
    iget-object p0, p0, Ly02;->v:Lc52;

    .line 32
    .line 33
    invoke-static {p0}, Ly02;->k(Lay1;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lay1;->m()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lc52;->n:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    iget-object p0, p0, Let;->j:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p0, Ly02;

    .line 50
    .line 51
    iget-object p0, p0, Ly02;->o:Lzy1;

    .line 52
    .line 53
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 57
    .line 58
    const-string p1, "OnEventListener had not been registered"

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lso;->b(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    throw p0
.end method
