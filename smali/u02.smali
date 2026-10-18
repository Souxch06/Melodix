.class public final Lu02;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lvv1;

.field public final synthetic k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lu02;->j:Lvv1;

    .line 5
    .line 6
    iput-object p1, p0, Lu02;->k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lu02;->k:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

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
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Li82;->B(Z)Lbc2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Lo62;

    .line 21
    .line 22
    iget-object p0, p0, Lu02;->j:Lvv1;

    .line 23
    .line 24
    invoke-direct {v2, v0, v1, p0}, Lo62;-><init>(Li82;Lbc2;Lvv1;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Li82;->z(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
