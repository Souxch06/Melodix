.class public final Le22;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lvv1;

.field public final synthetic k:Ltu1;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;Ltu1;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Le22;->j:Lvv1;

    .line 5
    .line 6
    iput-object p3, p0, Le22;->k:Ltu1;

    .line 7
    .line 8
    iput-object p4, p0, Le22;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p0, Le22;->m:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget-object v0, p0, Le22;->m:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 4
    .line 5
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lgx1;->l()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Lay1;->m()V

    .line 13
    .line 14
    .line 15
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Ly02;

    .line 18
    .line 19
    iget-object v2, v1, Ly02;->r:Lcb2;

    .line 20
    .line 21
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, v2, Let;->j:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v2, Ly02;

    .line 27
    .line 28
    sget-object v3, Lwa0;->b:Lwa0;

    .line 29
    .line 30
    iget-object v2, v2, Ly02;->j:Landroid/content/Context;

    .line 31
    .line 32
    const v4, 0xbdfcb8

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v2, v4}, Lwa0;->b(Landroid/content/Context;I)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget-object v3, p0, Le22;->j:Lvv1;

    .line 40
    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-object p0, v1, Ly02;->o:Lzy1;

    .line 44
    .line 45
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lzy1;->r:Lso;

    .line 49
    .line 50
    const-string v0, "Not bundling data. Service unavailable or out of date"

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, v1, Ly02;->r:Lcb2;

    .line 56
    .line 57
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    new-array v0, v0, [B

    .line 62
    .line 63
    invoke-virtual {p0, v3, v0}, Lcb2;->b0(Lvv1;[B)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    new-instance v1, Lx62;

    .line 68
    .line 69
    iget-object v2, p0, Le22;->k:Ltu1;

    .line 70
    .line 71
    iget-object p0, p0, Le22;->l:Ljava/lang/String;

    .line 72
    .line 73
    invoke-direct {v1, v0, v2, p0, v3}, Lx62;-><init>(Li82;Ltu1;Ljava/lang/String;Lvv1;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Li82;->z(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
