.class public final synthetic Lr82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lmd1;

.field public final synthetic k:Landroid/app/job/JobParameters;


# direct methods
.method public synthetic constructor <init>(Lmd1;Landroid/app/job/JobParameters;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lr82;->j:Lmd1;

    .line 5
    .line 6
    iput-object p2, p0, Lr82;->k:Landroid/app/job/JobParameters;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lr82;->j:Lmd1;

    .line 2
    .line 3
    iget-object v0, v0, Lmd1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Landroid/app/Service;

    .line 6
    .line 7
    check-cast v0, Lp82;

    .line 8
    .line 9
    iget-object p0, p0, Lr82;->k:Landroid/app/job/JobParameters;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Lp82;->c(Landroid/app/job/JobParameters;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
