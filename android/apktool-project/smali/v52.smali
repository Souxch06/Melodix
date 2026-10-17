.class public final Lv52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lvv1;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lv52;->j:Lvv1;

    .line 5
    .line 6
    iput-object p3, p0, Lv52;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lv52;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p0, Lv52;->m:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lv52;->m:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->b:Ly02;

    .line 4
    .line 5
    invoke-virtual {v0}, Ly02;->n()Li82;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lgx1;->l()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2}, Lay1;->m()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {v2, v0}, Li82;->B(Z)Lbc2;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    new-instance v1, Lh72;

    .line 21
    .line 22
    iget-object v3, p0, Lv52;->k:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v4, p0, Lv52;->l:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v6, p0, Lv52;->j:Lvv1;

    .line 27
    .line 28
    invoke-direct/range {v1 .. v6}, Lh72;-><init>(Li82;Ljava/lang/String;Ljava/lang/String;Lbc2;Lvv1;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v1}, Li82;->z(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
