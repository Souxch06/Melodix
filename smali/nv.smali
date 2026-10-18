.class public final Lnv;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/util/ArrayList;

.field public final synthetic k:Luv;


# direct methods
.method public constructor <init>(Luv;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lnv;->k:Luv;

    .line 5
    .line 6
    iput-object p2, p0, Lnv;->j:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 1
    iget-object v0, p0, Lnv;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    :cond_0
    :goto_0
    iget-object v4, p0, Lnv;->k:Luv;

    .line 9
    .line 10
    if-ge v2, v1, :cond_4

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    move-object v5, v3

    .line 19
    check-cast v5, Lsv;

    .line 20
    .line 21
    iget-object v9, v4, Luv;->r:Ljava/util/ArrayList;

    .line 22
    .line 23
    iget-wide v10, v4, Lly0;->f:J

    .line 24
    .line 25
    iget-object v3, v5, Lsv;->a:Lmu0;

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    move-object v7, v6

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    iget-object v3, v3, Lmu0;->a:Landroid/view/View;

    .line 33
    .line 34
    move-object v7, v3

    .line 35
    :goto_1
    iget-object v3, v5, Lsv;->b:Lmu0;

    .line 36
    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    iget-object v6, v3, Lmu0;->a:Landroid/view/View;

    .line 40
    .line 41
    :cond_2
    move-object v12, v6

    .line 42
    const/4 v13, 0x0

    .line 43
    if-eqz v7, :cond_3

    .line 44
    .line 45
    invoke-virtual {v7}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3, v10, v11}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    iget-object v3, v5, Lsv;->a:Lmu0;

    .line 54
    .line 55
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    iget v3, v5, Lsv;->e:I

    .line 59
    .line 60
    iget v8, v5, Lsv;->c:I

    .line 61
    .line 62
    sub-int/2addr v3, v8

    .line 63
    int-to-float v3, v3

    .line 64
    invoke-virtual {v6, v3}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 65
    .line 66
    .line 67
    iget v3, v5, Lsv;->f:I

    .line 68
    .line 69
    iget v8, v5, Lsv;->d:I

    .line 70
    .line 71
    sub-int/2addr v3, v8

    .line 72
    int-to-float v3, v3

    .line 73
    invoke-virtual {v6, v3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v6, v13}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 77
    .line 78
    .line 79
    move-result-object v14

    .line 80
    new-instance v3, Lrv;

    .line 81
    .line 82
    const/4 v8, 0x0

    .line 83
    invoke-direct/range {v3 .. v8}, Lrv;-><init>(Luv;Lsv;Landroid/view/ViewPropertyAnimator;Landroid/view/View;I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v14, v3}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 91
    .line 92
    .line 93
    :cond_3
    if-eqz v12, :cond_0

    .line 94
    .line 95
    invoke-virtual {v12}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    iget-object v3, v5, Lsv;->b:Lmu0;

    .line 100
    .line 101
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    invoke-virtual {v6, v13}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v3, v13}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3, v10, v11}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    const/high16 v7, 0x3f800000    # 1.0f

    .line 117
    .line 118
    invoke-virtual {v3, v7}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 119
    .line 120
    .line 121
    move-result-object v9

    .line 122
    new-instance v3, Lrv;

    .line 123
    .line 124
    const/4 v8, 0x1

    .line 125
    move-object v7, v12

    .line 126
    invoke-direct/range {v3 .. v8}, Lrv;-><init>(Luv;Lsv;Landroid/view/ViewPropertyAnimator;Landroid/view/View;I)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v9, v3}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 134
    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 139
    .line 140
    .line 141
    iget-object p0, v4, Luv;->n:Ljava/util/ArrayList;

    .line 142
    .line 143
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    return-void
.end method
