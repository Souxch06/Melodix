.class public final Lj32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lvv1;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Z

.field public final synthetic n:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Lvv1;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lj32;->j:Lvv1;

    .line 5
    .line 6
    iput-object p3, p0, Lj32;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lj32;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p5, p0, Lj32;->m:Z

    .line 11
    .line 12
    iput-object p1, p0, Lj32;->n:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lj32;->n:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

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
    new-instance v1, Lb62;

    .line 21
    .line 22
    iget-object v3, p0, Lj32;->k:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v4, p0, Lj32;->l:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean v6, p0, Lj32;->m:Z

    .line 27
    .line 28
    iget-object v7, p0, Lj32;->j:Lvv1;

    .line 29
    .line 30
    invoke-direct/range {v1 .. v7}, Lb62;-><init>(Li82;Ljava/lang/String;Ljava/lang/String;Lbc2;ZLvv1;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v1}, Li82;->z(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
